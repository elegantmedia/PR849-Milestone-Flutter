import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/utils/utils.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    this.onResetPassword,
    this.onForgotPassword,
    super.key,
  });

  final void Function(String currentPassword, String newPassword)? onResetPassword;
  final VoidCallback? onForgotPassword;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (!_formKey.currentState!.validate()) return;

    final onResetPassword = widget.onResetPassword;
    if (onResetPassword == null) {
      context.showSnackBar(context.l10n.passwordResetUnavailable);
      return;
    }

    FocusScope.of(context).unfocus();
    onResetPassword(
      _currentPasswordController.text,
      _newPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.changePassword,
        showBackButton: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ExtendedColumn(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Gaps.gapLg24,
              Center(
                child: Text(
                  context.l10n.changePasswordSubtitle,
                  style: context.bodyDefault(),
                  textAlign: TextAlign.center,
                ),
              ),
              Gaps.gapLg24,
              AuthFormFields.password(
                controller: _currentPasswordController,
                title: context.l10n.currentPassword,
                hintText: context.l10n.enterPassword,
                textInputAction: TextInputAction.next,
                validator: (value) => value == null || value.isEmpty ? context.l10n.pleaseEnterPassword : null,
              ),
              Gaps.gapMd16,
              AuthFormFields.password(
                controller: _newPasswordController,
                title: context.l10n.newPassword,
                hintText: context.l10n.enterPassword,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.newPassword],
              ),
              Gaps.gapMd16,
              AuthFormFields.password(
                controller: _confirmPasswordController,
                title: context.l10n.confirmPassword,
                hintText: context.l10n.enterPassword,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.newPassword],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.pleaseEnterPassword;
                  }
                  return value == _newPasswordController.text ? null : context.l10n.passwordsDoNotMatch;
                },
                onFieldSubmitted: (_) => _resetPassword(),
              ),
              Gaps.gapLg24,
              const Spacer(),
              CommonButton.primary(
                label: context.l10n.resetPassword,
                onPressed: _resetPassword,
              ),
              Gaps.gapMd16,
              Center(
                child: CommonButton.text(
                  label: context.l10n.forgotPassword,
                  textStyle: context.bodyDefault(
                    color: context.colorScheme.secondary,
                    weight: FontWeight.w700,
                  ),
                  onPressed: () => context.showSnackBar(context.l10n.forgotPasswordUnavailable),
                ),
              ),
              Gaps.gapLg24,
            ],
          ),
        ),
      ),
    );
  }
}
