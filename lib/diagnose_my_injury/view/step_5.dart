import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step5 extends StatefulWidget {
  const Step5({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  String? _dailyLifeImpact;
  String? _previousInjury;
  String? _treatment;

  @override
  void dispose() {
    _goalController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.diagnoseFunctionHistory,
                  style: context.headlineTitle(color: colors.onSurface),
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnoseDailyLifeQuestion,
                  options: [
                    DiagnosisOption('work', l10n.diagnoseDailyLifeWork),
                    DiagnosisOption('sport', l10n.diagnoseDailyLifeSport),
                    DiagnosisOption('sleep', l10n.diagnoseDailyLifeSleep),
                    DiagnosisOption('household', l10n.diagnoseDailyLifeHousehold),
                    DiagnosisOption('driving', l10n.diagnoseDailyLifeDriving),
                  ],
                  selectedValue: _dailyLifeImpact,
                  onSelected: (value) => setState(() => _dailyLifeImpact = value),
                ),
                const SizedBox(height: 24),
                TextQuestionField(
                  title: l10n.diagnoseGoalQuestion,
                  controller: _goalController,
                  hintText: l10n.diagnoseRelevantHint,
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnosePreviousInjuryQuestion,
                  options: [
                    DiagnosisOption('yes', l10n.yes),
                    DiagnosisOption('no', l10n.no),
                  ],
                  selectedValue: _previousInjury,
                  onSelected: (value) => setState(() => _previousInjury = value),
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnoseTreatmentQuestion,
                  options: [
                    DiagnosisOption('none', l10n.diagnoseTreatmentNone),
                    DiagnosisOption('rest', l10n.diagnoseTreatmentRest),
                    DiagnosisOption('iceHeat', l10n.diagnoseTreatmentIceHeat),
                    DiagnosisOption('physiotherapy', l10n.diagnoseTreatmentPhysiotherapy),
                    DiagnosisOption('gp', l10n.diagnoseTreatmentGp),
                    DiagnosisOption('imaging', l10n.diagnoseTreatmentImaging),
                    DiagnosisOption('medication', l10n.diagnoseTreatmentMedication),
                  ],
                  selectedValue: _treatment,
                  onSelected: (value) => setState(() => _treatment = value),
                ),
                const SizedBox(height: 24),
                TextQuestionField(
                  title: l10n.diagnoseOtherContext,
                  description: l10n.diagnoseOtherContextDescription,
                  controller: _contextController,
                  hintText: l10n.diagnoseRelevantHint,
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
