import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/legal_information/legal_information.dart';
import 'package:milestone/more/more.dart';
import 'package:milestone/utils/utils.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.instance<MoreController>();

    final menuItems = [
      MenuItem(
        title: context.l10n.accountSettings,
        icon: Icons.person,
        onTap: () {
          Pages.profile.go(context);
        },
      ),
      MenuItem(
        title: context.l10n.notifications,
        icon: Icons.notifications,
      ),
      MenuItem(
        title: context.l10n.contactUs,
        icon: Icons.call,
        onTap: () => Pages.contactUs.push<void>(context),
      ),
      MenuItem(
        title: context.l10n.termsAndConditions,
        icon: Icons.description,
        onTap: () => Pages.legalInformation.push<void>(
          context,
          queryParams: {'key': LegalKeys.termsAndConditions},
        ),
      ),
      MenuItem(
        title: context.l10n.privacyPolicy,
        icon: Icons.shield,
        onTap: () => Pages.legalInformation.push<void>(
          context,
          queryParams: {'key': LegalKeys.privacyPolicy},
        ),
      ),
      MenuItem(
        title: context.l10n.appSettings,
        icon: Icons.settings,
        onTap: () => Pages.settings.push<void>(context),
      ),
      MenuItem(
        title: context.l10n.logout,
        icon: Icons.logout,
        color: context.colorScheme.error,
        onTap: () async {
          await controller.logout(context);
        },
      ),
    ];

    return Scaffold(
      appBar: const CommonAppBar(
        content: CommonAppBarContent.logo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RelativeGap(mainAxisExtent: 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.l10n.more,
              style: context.headline1(),
            ),
          ),
          Gaps.gapMd16,
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              itemCount: menuItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 22),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return MoreTab(
                  icon: item.icon,
                  title: item.title,
                  subtitle: item.subtitle,
                  accentColor: item.color,
                  onTap: item.onTap ??
                      () => context.showSnackBar(
                            '${item.title} is coming soon',
                          ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
