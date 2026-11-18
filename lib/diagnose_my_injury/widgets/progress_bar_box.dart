import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class ProgressBarBox extends StatelessWidget {
  const ProgressBarBox({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  }) : assert(
       value >= 0 && value <= 10,
       'ProgressBarBox value must be between 0 and 10.',
     );

  final String title;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final rating = MaterialLocalizations.of(context).formatDecimal(value.round());
    final maximum = MaterialLocalizations.of(context).formatDecimal(10);

    return Card(
      margin: EdgeInsets.zero,
      color: colors.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: context.bodyLarge(weight: FontWeight.w700)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(trackHeight: 4),
              child: Semantics(
                label: title,
                child: Slider(
                  value: value,
                  max: 10,
                  divisions: 10,
                  label: rating,
                  activeColor: colors.secondary,
                  inactiveColor: colors.outlineVariant,
                  onChanged: onChanged,
                ),
              ),
            ),
            Text('$rating/$maximum', style: context.bodyDefault()),
          ],
        ),
      ),
    );
  }
}
