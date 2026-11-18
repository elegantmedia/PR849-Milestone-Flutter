import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/utils/extensions/context_extensions.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({
    required this.title,
    required this.icon,
    this.subtitle,
    this.accentColor,
    this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final String? subtitle;
  final Color? accentColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    final iconColor = accentColor ?? context.colorScheme.secondary;

    return Material(
      color: context.colorScheme.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: context.themeColors.darkBorderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 28),
                Expanded(
                  child: subtitle == null
                      ? Text(
                          title,
                          style: context.bodyLarge(weight: FontWeight.w500),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: context.bodyLarge(weight: FontWeight.w500),
                            ),
                            Text(
                              subtitle!,
                              style: context.bodySmall(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: iconColor,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
