import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milestone/app/app.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _acceptedTerms = false;

  late final TextEditingController _emailController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _firstNameFocusNode;
  late final FocusNode _lastNameFocusNode;
  late final FocusNode _passwordFocusNode;

  final AuthService authService = GetIt.instance<AuthService>();

  /// Stream subscription for monitoring changes in the authentication state.
  late StreamSubscription<AuthState> _authStateSubscription;

  /// Initializes the state of the widget.
  /// Sets up the text controllers for email, password, and phone.
  /// Subscribes to the authentication state changes and calls the [onAuthStateChanged] method.
  @override
  void initState() {
    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _authStateSubscription = authService.onAuthStateChanges.listen(
      onAuthStateChanged,
    );
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
        title: context.l10n.signUpFailed,
        message: state.message,
      );
    } else if (state is AuthSuccess) {
      TextInput.finishAutofillContext();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
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
                    const RelativeGap(mainAxisExtent: 0.05),
                    Text(
                      context.l10n.signUp,
                      style: context.headline1(),
                    ),
                    const RelativeGap(mainAxisExtent: 0.02),
                    AuthFormFields.email(
                      controller: _emailController,
                      hintText: context.l10n.enterEmailHint,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_firstNameFocusNode);
                      },
                      title: context.l10n.email,
                    ),
                    Gaps.gapMd16,
                    CommonTextField(
                      controller: _firstNameController,
                      focusNode: _firstNameFocusNode,
                      title: context.l10n.firstName,
                      hintText: context.l10n.firstNameRequired,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: (value) => value == null || value.trim().isEmpty ? context.l10n.firstNameRequired : null,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_lastNameFocusNode);
                      },
                    ),
                    Gaps.gapMd16,
                    CommonTextField(
                      controller: _lastNameController,
                      focusNode: _lastNameFocusNode,
                      title: context.l10n.lastName,
                      hintText: context.l10n.lastNameRequired,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: (value) => value == null || value.trim().isEmpty ? context.l10n.lastNameRequired : null,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                    ),
                    Gaps.gapMd16,
                    AuthFormFields.password(
                      controller: _passwordController,
                      hintText: context.l10n.enterPassword,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      title: context.l10n.password,
                      requireStrict: false,
                      autofillHints: const [AutofillHints.newPassword],
                    ),
                    Gaps.gapLg24,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Semantics(
                          label: '${context.l10n.agreeTo}${context.l10n.termsOfService}',
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Checkbox(
                            value: _acceptedTerms,
                            activeColor: context.colorScheme.secondary,
                            side: BorderSide(color: context.colorScheme.secondary),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                _acceptedTerms = value ?? false;
                              });
                            },
                          ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: context.l10n.agreeTo,
                              style: context.bodyDefault(),
                              children: [
                                TextSpan(
                                  text: context.l10n.termsOfService,
                                  style: context
                                      .bodyDefault(
                                        color: context.colorScheme.secondary,
                                      )
                                      .bold,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO(ishanga): Add Terms and Conditions page
                                    },
                                ),
                                TextSpan(text: context.l10n.termsAndPrivacyConfirm),
                                TextSpan(
                                  text: context.l10n.privacyPolicy,
                                  style: context
                                      .bodyDefault(
                                        color: context.colorScheme.secondary,
                                      )
                                      .bold,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO(ishanga): Add Privacy Policy page
                                    },
                                ),
                                const TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CommonButton.primary(
                      isLoading: snapshot.data is AuthLoading,
                      label: context.l10n.verifyAccount,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          unawaited(
                            authService.signUp(
                              email: _emailController.text,
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              password: _passwordController.text,
                            ),
                          );
                        }
                        //getIt<ThemeServiceProvider>().toggleTheme();
                      },
                    ),
                    Gaps.gapMd16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.l10n.alreadyHaveAccount),
                        Center(
                          child: CommonButton.text(
                            onPressed: () => Pages.signIn.go(context),
                            label: context.l10n.signIn,
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
