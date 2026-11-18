import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:milestone/profile/profile.dart';
import 'package:milestone/utils/utils.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late UserProfileService _userProfileService;

  @override
  void initState() {
    super.initState();
    _userProfileService = GetIt.instance<UserProfileService>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _userProfileService.fetchUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.account,
        showBackButton: true,
      ),
      body: StreamBuilder<ProfileState>(
        stream: _userProfileService.profileStateStream,
        builder: (context, snapshot) {
          final userProfile = _userProfileService.userProfile;
          if (userProfile == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final imageUrl = userProfile.imageUrl.trim();
          final imagePlaceholder = ColoredBox(
            color: context.themeColors.profilePlaceholderColor,
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 48,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          );

          return ExtendedColumn(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              Gaps.gapMd16,
              SizedBox(
                width: double.infinity,
                height: 120,
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 96,
                          height: 96,
                          child: imageUrl.isEmpty
                              ? imagePlaceholder
                              : Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => imagePlaceholder,
                                  loadingBuilder: (context, child, loadingProgress) => loadingProgress == null ? child : imagePlaceholder,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: -14,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: InkWell(
                              onTap: () {
                                log('Edit Profile');
                              },
                              customBorder: const CircleBorder(),
                              child: Icon(Icons.edit, color: context.colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.gapMd16,
              UserDetailItem(
                title: context.l10n.firstName,
                value: userProfile.firstName,
              ),
              Gaps.gapSm8,
              UserDetailItem(
                title: context.l10n.lastName,
                value: userProfile.lastName,
              ),
              Gaps.gapSm8,
              const Spacer(),
              CommonButton.primary(
                onPressed: () => Pages.editProfile.go(context),
                label: context.l10n.editProfile,
              ),
              Gaps.gapMd16,
              CommonButton.outline(
                onPressed: () {
                  Pages.changePassword.go(context);
                },
                label: context.l10n.changePassword,
              ),
              const RelativeGap(mainAxisExtent: 0.05),
            ],
          );
        },
      ),
    );
  }
}
