import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milestone/app/app.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/utils/utils.dart';
import 'package:pinput/pinput.dart';

class CodeVerificationPage extends StatefulWidget {
  const CodeVerificationPage({super.key});

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {
  final AuthService _authService = GetIt.instance<AuthService>();
  late final TextEditingController _codeController;

  /// Stream subscription for monitoring changes in the authentication state.
  late StreamSubscription<AuthState> _authStateSubscription;

  /// Initializes the state of the widget.
  /// Subscribes to the authentication state changes and calls the [onAuthStateChanged] method.
  @override
  void initState() {
    _codeController = TextEditingController();
    _authStateSubscription = _authService.onAuthStateChanges.listen(onAuthStateChanged);
    super.initState();
  }

  /// Callback function that is called when the authentication state changes.
  /// Shows an adaptive dialog with an error message if the authentication fails.
  /// The error message is obtained from the [AuthState] object.
  /// The dialog is dismissed when the user taps the 'OK' button.
  Future<void> onAuthStateChanged(AuthState state) async {
    if (state is AuthCodeVerificationFailed && mounted) {
      await CommonDialog.alert(
        context,
        title: context.l10n.error,
        message: state.message,
      );
    } else if (state is AuthCodeResendFailed) {
      await CommonDialog.alert(
        context,
        title: context.l10n.error,
        message: state.message,
      );
    }
  }

  @override
  void dispose() {
    unawaited(_authStateSubscription.cancel());
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: context.headline1(color: context.colorScheme.onSurface),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.themeColors.darkBorderColor),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colorScheme.secondary),
      ),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colorScheme.primary),
      ),
    );
    final followingPinTheme = defaultPinTheme;
    return StreamBuilder<AuthState>(
      stream: _authService.onAuthStateChanges,
      builder: (context, snapshot) {
        return AbsorbPointer(
          absorbing: snapshot.data is AuthLoading,
          child: Scaffold(
            appBar: CommonAppBar(
              title: context.l10n.verification,
              actions: [
                CommonButton.text(
                  onPressed: () async {
                    await _authService.logout();
                  },
                  label: context.l10n.logOut,
                  foregroundColor: context.colorScheme.error,
                ),
              ],
            ),
            body: ExtendedColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RelativeGap(mainAxisExtent: 0.05),
                Text(
                  context.l10n.enterVerificationCode,
                  textAlign: TextAlign.center,
                  style: context.headline1(),
                ),
                Gaps.gapMd16,
                Text(
                  context.l10n.verificationCodeSent,
                  textAlign: TextAlign.center,
                  style: context.bodyLarge(),
                ),
                // add email here
                Text(
                  'sample@mail.com',
                  textAlign: TextAlign.center,
                  style: context.bodyLarge(),
                ),
                Gaps.gapXxl48,
                
                SizedBox(
                  width: double.infinity,
                  child: Pinput(
                    autofocus: true,
                    controller: _codeController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    followingPinTheme: followingPinTheme,                   
                  ),
                ),
                //Gaps.gapXxl48,
                const Spacer(),
                CommonButton.primary(
                  isLoading: snapshot.data is AuthLoading,
                  label: context.l10n.verify,
                  onPressed: () async {
                    await _authService.verify(_codeController.text);
                  },
                ),
                Gaps.gapMd16,
                //const Spacer(),
                Text(
                  context.l10n.didntReceiveCode,
                  textAlign: TextAlign.center,
                  style: context.bodyLarge(),
                ),
                Gaps.gapXs4,
                CommonButton.text(
                  onPressed: _authService.resendVerificationCode,
                  label: context.l10n.resendCode,
                ),
                
                const RelativeGap(mainAxisExtent: 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
