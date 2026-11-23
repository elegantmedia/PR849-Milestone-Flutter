import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/profile/profile.dart';
import 'package:milestone/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDeleting = false;

  Future<void> _handleDeleteAccount() async {
    final confirmed = await CommonDialog.confirm(
      context,
      title: 'Delete Account?',
      message: 'You won’t be able to undo this action.',
      cancelText: 'Cancel',
      confirmText: 'Delete',
      isDangerous: true,
      cancelColor: context.colorScheme.secondary,
    );

    if (!confirmed || !mounted) return;

    setState(() => _isDeleting = true);

    try {
      if (GetIt.instance.isRegistered<UserProfileService>()) {
        await GetIt.instance<UserProfileService>().deleteUserAccount();
      }
      if (GetIt.instance.isRegistered<AuthService>()) {
        await GetIt.instance<AuthService>().onUserProfileDeleted();
      }
    } catch (_) {
      // Proceed to intro navigation even if backend delete fails
    } finally {
      if (mounted) {
        setState(() => _isDeleting = false);
        Pages.intro.go(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final borderRadius = BorderRadius.circular(12);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: CommonAppBar(
        title: context.l10n.appSettings,
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: colors.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                  side: BorderSide(color: context.themeColors.darkBorderColor),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  borderRadius: borderRadius,
                  onTap: _isDeleting ? null : _handleDeleteAccount,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delete Account',
                          style: context.bodyLarge(
                            color: colors.onSurface,
                            weight: FontWeight.w400,
                          ),
                        ),
                        if (_isDeleting)
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colors.secondary,
                            ),
                          )
                        else
                          Icon(
                            Icons.chevron_right,
                            color: colors.secondary,
                            size: 24,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
