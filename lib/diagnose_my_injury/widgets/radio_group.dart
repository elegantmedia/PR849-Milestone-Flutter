import 'package:flutter/material.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/radio_button_box.dart';

class DiagnosisRadioGroup extends StatelessWidget {
  const DiagnosisRadioGroup({
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    super.key,
  });

  final List<DiagnosisOption> options;
  final String? selectedValue;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < options.length; index++) ...[
          RadioButtonBox(
            label: options[index].label,
            description: options[index].description,
            isSelected: options[index].value == selectedValue,
            onTap: () => onSelected(options[index].value),
          ),
          if (index < options.length - 1) const SizedBox(height: 6),
        ],
      ],
    );
  }
}
