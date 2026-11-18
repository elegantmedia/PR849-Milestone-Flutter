import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/utils/extensions/context_extensions.dart';
import 'package:milestone/utils/extensions/l10n_extension.dart';

class UserDetailItem extends StatelessWidget {
  const UserDetailItem({
    required this.title,
    this.value,
    super.key,
  });

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final trimmedValue = value?.trim();
    final displayValue = trimmedValue == null || trimmedValue.isEmpty ? context.l10n.notProvided : trimmedValue;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.themeColors.darkBorderColor,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: context.bodyDefault(),
          ),
          const Spacer(),
          Text(
            displayValue,
            style: context.bodyDefault(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
