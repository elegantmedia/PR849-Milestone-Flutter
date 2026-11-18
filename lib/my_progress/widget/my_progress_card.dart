import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class ProgressStatistic extends StatelessWidget {
  const ProgressStatistic({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.count,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 26, color: iconColor),
            const SizedBox(width: 18),
            Expanded(child: Text(label, style: context.bodyLarge())),
            const SizedBox(width: 12),
            Text(
              MaterialLocalizations.of(context).formatDecimal(count),
              style: context.headline2(),
            ),
          ],
        ),
      ),
    );
  }
}
