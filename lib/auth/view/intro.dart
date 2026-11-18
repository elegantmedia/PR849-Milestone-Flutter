import 'package:flutter/material.dart';
import 'package:milestone/app/app.dart';
import 'package:milestone/utils/utils.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.18),
            child: const CommonAssetImage(
            assetPath: AppImages.introBackground,
            fit: BoxFit.cover,
          ),
          ),
          //ColoredBox(color: Colors.black.withValues(alpha: 0.35)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RelativeGap(mainAxisExtent: 0.04),
                const AppLogo(aspectRatio: 25 / 9),
                const Spacer(),
                Text(
                  context.l10n.introWelcome,
                  style: context.bodyDefault(color: context.colorScheme.secondary),
                ),
                const FixedGap(mainAxisExtent: 8),
                Text(
                  context.l10n.introHeadline,
                  style: context.headline1(color: context.colorScheme.primary, height: 1.2),
                ),
                const FixedGap(mainAxisExtent: 8),
                Text(
                  context.l10n.introDescription,
                  style: context.bodyDefault(color: context.colorScheme.primary),
                ),
                const FixedGap(mainAxisExtent: 24),
                CommonButton.primary(
                  onPressed: () {
                    Pages.signIn.go(context);
                  },
                  label: context.l10n.logIn,
                ),
                const FixedGap(mainAxisExtent: 12),
                CommonButton.outline(
                  onPressed: () {
                    Pages.signUp.go(context);
                  },
                  label: context.l10n.signUp,
                ),
                const RelativeGap(mainAxisExtent: 0.02),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
