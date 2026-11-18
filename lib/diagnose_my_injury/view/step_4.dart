import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step4 extends StatefulWidget {
  const Step4({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final TextEditingController _worseController = TextEditingController();
  final TextEditingController _betterController = TextEditingController();
  final List<double> _painRatings = [0, 0, 0];
  final Set<String> _selectedSensations = {};
  String? _pattern;
  String? _nightPain;
  String? _spreading;

  @override
  void dispose() {
    _worseController.dispose();
    _betterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final ratingTitles = [
      l10n.diagnosePainNow,
      l10n.diagnosePainWorst,
      l10n.diagnosePainAverage,
    ];
    final sensations = [
      DiagnosisOption('sharp', l10n.diagnosePainSharp),
      DiagnosisOption('aching', l10n.diagnosePainAching),
      DiagnosisOption('burning', l10n.diagnosePainBurning),
      DiagnosisOption('throbbing', l10n.diagnosePainThrobbing),
      DiagnosisOption('stiffness', l10n.diagnosePainStiffness),
      DiagnosisOption('numbness', l10n.diagnosePainNumbness),
      DiagnosisOption('weakness', l10n.diagnosePainWeakness),
    ];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.diagnosePainProfile,
                  style: context.headlineTitle(color: colors.onSurface),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.diagnosePainScaleDescription,
                  style: context.bodyLarge(weight: FontWeight.w700),
                ),
                const SizedBox(height: 14),
                for (var index = 0; index < ratingTitles.length; index++) ...[
                  ProgressBarBox(
                    title: ratingTitles[index],
                    value: _painRatings[index],
                    onChanged: (value) => setState(() => _painRatings[index] = value),
                  ),
                  if (index < ratingTitles.length - 1) const SizedBox(height: 10),
                ],
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnosePainPattern,
                  options: [
                    DiagnosisOption('constant', l10n.diagnosePainConstant),
                    DiagnosisOption('intermittent', l10n.diagnosePainIntermittent),
                  ],
                  selectedValue: _pattern,
                  onSelected: (value) => setState(() => _pattern = value),
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnoseNightPain,
                  options: [
                    DiagnosisOption('none', l10n.diagnoseNightPainNone),
                    DiagnosisOption('mild', l10n.diagnoseNightPainMild),
                    DiagnosisOption('wakes', l10n.diagnoseNightPainWakes),
                  ],
                  selectedValue: _nightPain,
                  onSelected: (value) => setState(() => _nightPain = value),
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnosePainSensation,
                  description: l10n.diagnoseSelectAllThatApply,
                  child: Column(
                    children: [
                      for (var index = 0; index < sensations.length; index++) ...[
                        CheckTextBox(
                          label: sensations[index].label,
                          value: _selectedSensations.contains(sensations[index].value),
                          onChanged: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedSensations.add(sensations[index].value);
                              } else {
                                _selectedSensations.remove(sensations[index].value);
                              }
                            });
                          },
                        ),
                        if (index < sensations.length - 1) const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextQuestionField(
                  title: l10n.diagnosePainWorse,
                  controller: _worseController,
                ),
                const SizedBox(height: 24),
                TextQuestionField(
                  title: l10n.diagnosePainBetter,
                  controller: _betterController,
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnosePainSpreading,
                  options: [
                    DiagnosisOption('yes', l10n.yes),
                    DiagnosisOption('no', l10n.no),
                  ],
                  selectedValue: _spreading,
                  onSelected: (value) => setState(() => _spreading = value),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 14),
          child: SizedBox(
            width: double.infinity,
            child: CommonButton.primary(
              label: l10n.continueAction,
              onPressed: widget.onContinue,
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ),
      ],
    );
  }
}
