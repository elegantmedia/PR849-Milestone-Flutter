import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class RadioButtonBox extends StatelessWidget {
  const RadioButtonBox({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.description,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final borderRadius = BorderRadius.circular(18);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: borderRadius,
            border: Border.all(
              color: isSelected ? colors.secondary : colors.outlineVariant,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? colors.secondary : colors.outline,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.secondary,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: context.bodySmall(
                          color: isSelected ? colors.onSurface : colors.onSurfaceVariant,
                          weight: FontWeight.w700,
                        ),
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          description!,
                          style: context.bodySmall(
                            color: colors.onSurfaceVariant,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
