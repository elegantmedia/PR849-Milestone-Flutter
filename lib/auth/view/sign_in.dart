import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milestone/app/app.dart';

import 'package:milestone/auth/auth.dart';
import 'package:milestone/utils/utils.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  final AuthService authService = GetIt.instance<AuthService>();

  /// Stream subscription for monitoring changes in the authentication state.
  late StreamSubscription<AuthState> _authStateSubscription;

  /// Initializes the state of the widget.
  /// Sets up the text controllers for email, password, and phone.
  /// Subscribes to the authentication state changes and calls the [onAuthStateChanged] method.
  @override
  void initState() {
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _authStateSubscription = authService.onAuthStateChanges.listen(onAuthStateChanged);
    super.initState();
  }

  /// Callback function that is called when the authentication state changes.
  /// Shows an adaptive dialog with an error message if the authentication fails.
  /// The error message is obtained from the [AuthState] object.
  /// The dialog is dismissed when the user taps the 'OK' button.
  Future<void> onAuthStateChanged(AuthState state) async {
    if (state is AuthFailed && mounted) {
      TextInput.finishAutofillContext(shouldSave: false);
      await CommonDialog.alert(
        context,
        title: context.l10n.signInFailed,
        message: state.message,
      );
    } else if (state is AuthSuccess && mounted) {
      TextInput.finishAutofillContext();
     // Pages.home.go(context);
    }
  }

  // Future<void> onAuthStateChanged(AuthState state) async {
  //   if (state is AuthFailed && mounted) {
  //     TextInput.finishAutofillContext(shouldSave: false);
  //     await CommonDialog.alert(
  //       context,
  //       title: context.l10n.signInFailed,
  //       message: state.message,
  //     );
  //   } else {
  //     Pages.home.go(context);
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    unawaited(_authStateSubscription.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: authService.onAuthStateChanges,
      builder: (context, snapshot) {
        return AbsorbPointer(
          absorbing: snapshot.data is AuthLoading,
          child: Scaffold(
            appBar: const CommonAppBar(
              content: CommonAppBarContent.logo,
              showBackButton: true,
            ),
            body: AutofillGroup(
              child: Form(
                key: _formKey,
                child: ExtendedColumn(
                  children: [
                    const RelativeGap(mainAxisExtent: 0.02),
                    Text(
                      context.l10n.signIn,
                      style: context.headline1(),
                    ),
                    const RelativeGap(mainAxisExtent: 0.05),
                    AuthFormFields.email(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      title: context.l10n.email,
                    ),
                    Gaps.gapMd16,
                    AuthFormFields.password(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      title: context.l10n.password,
                      requireStrict: false,
                    ),
                    Gaps.gapMd16,
                    Center(
                      child: CommonButton.text(
                        onPressed: () => Pages.forgotPassword.go(context),
                        label: context.l10n.forgotPassword,
                        textStyle: context.bodyDefault(),
                      ),
                    ),
                    // Gaps.gapMd16,
                    const Spacer(),
                    CommonButton.primary(
                      label: context.l10n.signIn,
                      isLoading: snapshot.data is AuthLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          unawaited(
                            authService.login(
                              _emailController.text,
                              _passwordController.text,
                            ),
                          );
                        }
                      },
                    ).pad(const EdgeInsets.symmetric(horizontal: 16)),
                    Gaps.gapMd16,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.l10n.dontHaveAccount),
                        Center(
                          child: CommonButton.text(
                            onPressed: () => Pages.signUp.go(context),
                            label: context.l10n.signUp,
                            textStyle: context.bodyDefault().bold,
                          ),
                        ),
                      ],
                    ),
                    const RelativeGap(mainAxisExtent: 0.02),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
