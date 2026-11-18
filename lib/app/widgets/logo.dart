import 'package:flutter/material.dart';
import 'package:milestone/utils/utils.dart';

/// A widget that displays the app logo.
///
/// The [AppLogo] widget takes in an [aspectRatio] parameter to control the aspect ratio of the logo.
/// It renders the SVG logo within the specified aspect ratio.
class AppLogo extends StatelessWidget {
  const AppLogo({
    required this.aspectRatio,
    super.key,
  });
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: const Hero(
        tag: 'app-logo',
        child: Material(
          color: Colors.transparent, 
          child: CommonAssetImage(assetPath: AppImages.logo),
        ),
      ),
    );
  }
}
