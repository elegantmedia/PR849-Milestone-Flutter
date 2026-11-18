import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step1 extends StatefulWidget {
  const Step1({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final Set<int> _selectedSafetyChecks = {};

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final safetyItems = [
      l10n.diagnoseSafetyWeightLoss,
      l10n.diagnoseSafetyFever,
      l10n.diagnoseSafetyNumbness,
      l10n.diagnoseSafetyBladderBowel,
      l10n.diagnoseSafetyChestPain,
      l10n.diagnoseSafetyDeformity,
      l10n.diagnoseSafetyWeightBearing,
      l10n.diagnoseSafetyNightPain,
      l10n.diagnoseSafetyCancer,
      l10n.diagnoseSafetyHighForce,
    ];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: colors.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: colors.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.diagnosePainRatingTitle,
                          style: context.headlineTitle(color: colors.onSurface),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          l10n.diagnosePainRatingDescription,
                          style: context.bodyDefault(
                            color: colors.onSurface,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                QuestionField(
                  title: l10n.diagnoseSafetyScreen,
                  spacing: 18,
                  child: Column(
                    children: [
                      for (var index = 0; index < safetyItems.length; index++) ...[
                        CheckTextBox(
                          key: ValueKey(index),
                          label: safetyItems[index],
                          value: _selectedSafetyChecks.contains(index),
                          onChanged: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                _selectedSafetyChecks.add(index);
                              } else {
                                _selectedSafetyChecks.remove(index);
                              }
                            });
                          },
                        ),
                        if (index < safetyItems.length - 1) const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: SizedBox(
            width: double.infinity,
            child: CommonButton.primary(
              label: l10n.continueAction,
              onPressed: widget.onContinue,
              //minimumSize: const Size.fromHeight(72),
              textStyle: context.buttonPrimary(color: colors.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
