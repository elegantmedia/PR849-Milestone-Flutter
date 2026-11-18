import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/radio_group.dart';

class QuestionField extends StatelessWidget {
  const QuestionField({
    required this.title,
    this.options,
    this.selectedValue,
    this.onSelected,
    this.description,
    this.child,
    this.spacing = 8,
    super.key,
  });

  final String title;
  final List<DiagnosisOption>? options;
  final String? selectedValue;
  final ValueChanged<String>? onSelected;
  final String? description;
  final Widget? child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.bodyDefault(weight: FontWeight.w700)),
        if (description != null) ...[
          const SizedBox(height: 2),
          Text(
            description!,
            style: context.bodySmall(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        SizedBox(height: spacing),
        if (options != null && onSelected != null)
          DiagnosisRadioGroup(
            options: options!,
            selectedValue: selectedValue,
            onSelected: onSelected!,
          ),
        if (child != null) child!,
      ],
    );
  }
}
