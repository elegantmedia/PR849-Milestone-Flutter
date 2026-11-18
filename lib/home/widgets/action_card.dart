import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    required this.icon,
    required this.color,
    required this.label,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Expanded(
      child: Card(
        color: colors.surfaceContainer,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colors.outlineVariant),
        ),
        child: SizedBox(
          height: 190,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: color, size: 30),
                  const SizedBox(height: 24),
                  Expanded(child: Text(label, style: context.bodyDefault())),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: onTap,
                      tooltip: label,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints.tightFor(
                        width: 48,
                        height: 48,
                      ),
                      icon: SizedBox.square(
                        dimension: 32,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.secondaryContainer,
                            border: Border.all(
                              color: colors.secondary,
                              width: 0.5,
                            ),
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: colors.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
