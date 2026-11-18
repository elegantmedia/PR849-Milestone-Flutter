import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays an image from assets, supporting both SVG and raster formats.
///
/// The [CommonAssetImage] widget automatically determines whether to use [SvgPicture.asset]
/// or [Image.asset] based on the file extension of the provided [assetPath].
class CommonAssetImage extends StatelessWidget {
  /// Creates a [CommonAssetImage] widget.
  const CommonAssetImage({
    required this.assetPath,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.placeholder,
  });

  /// The path to the asset image.
  final String assetPath;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;

  /// The color to apply to the image (uses [ColorFilter] for SVG and [Color] for Image).
  final Color? color;

  /// An optional placeholder widget to show if the image is loading or fails to load.
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        placeholderBuilder: placeholder != null ? (context) => placeholder! : null,
      );
    } else {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: placeholder != null ? (context, error, stackTrace) => placeholder! : null,
      );
    }
  }
}
