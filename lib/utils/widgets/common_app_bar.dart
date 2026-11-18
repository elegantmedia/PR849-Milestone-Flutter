import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/utils/assets/images.dart';
import 'package:milestone/utils/extensions/context_extensions.dart';
import 'package:milestone/utils/widgets/common_asset_image.dart';

enum CommonAppBarContent { title, logo, none }

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.content = CommonAppBarContent.title,
    this.title,
    this.showBackButton = false,
    this.transparent = false,
    this.backgroundColor,
    this.actions = const [],
    this.onBackPressed,
    this.toolbarHeight = 44,
  });

  final CommonAppBarContent content;
  final String? title;
  final bool showBackButton;
  final bool transparent;
  final Color? backgroundColor;
  final List<Widget> actions;
  final VoidCallback? onBackPressed;
  final double toolbarHeight;

    double get _androidTopPadding =>
      defaultTargetPlatform == TargetPlatform.android ? 8.0 : 0.0;

  @override
    Size get preferredSize =>
      Size.fromHeight(toolbarHeight + _androidTopPadding);

  void _handleBack(BuildContext context) {
    if (onBackPressed != null) {
      onBackPressed!();
      return;
    }

    final navigator = Navigator.of(context);
    if (navigator.canPop()) navigator.pop();
  }

  Widget? _buildCenterContent(BuildContext context) {
    switch (content) {
      case CommonAppBarContent.title:
        return title == null
            ? null
            : Text(
                title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.headline3(color: context.colorScheme.primary),
              );
      case CommonAppBarContent.logo:
        return const SizedBox(
          width: 64,
          height: 36,
          child: CommonAssetImage(
            assetPath: AppImages.logo,
          ),
        );
      case CommonAppBarContent.none:
        return null;
    }
  }

  Widget? _buildLeading(BuildContext context, ColorScheme colorScheme) {
    if (!showBackButton) return null;

    return Padding(
			padding: const EdgeInsets.only(left: 12),
			child: SizedBox.square(
      dimension: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: transparent ? colorScheme.surface.withValues(alpha: 0.4) : context.themeColors.darkBlueGrayColor,
          shape: BoxShape.circle,
          border: Border.all(color: context.themeColors.darkBorderColor, width: 1.5),
        ),
        child: IconButton(
          onPressed: () => _handleBack(context),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints.tightFor(width: 32, height: 32),
          icon: Icon(Icons.chevron_left, size: 32, color: colorScheme.onSurface),
        ),
      ),
    ),
		);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: EdgeInsets.only(top: _androidTopPadding),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        automaticallyImplyLeading: false,
        leadingWidth: showBackButton ? 56 : null,
        leading: _buildLeading(context, colorScheme),
        title: _buildCenterContent(context),
        centerTitle: true,
        actions: actions.isEmpty ? null : actions,
        backgroundColor: transparent ? Colors.transparent : backgroundColor ?? colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
