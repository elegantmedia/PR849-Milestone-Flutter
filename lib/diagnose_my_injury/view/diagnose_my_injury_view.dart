import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/view/step_1.dart';
import 'package:milestone/diagnose_my_injury/view/step_2.dart';
import 'package:milestone/diagnose_my_injury/view/step_3.dart';
import 'package:milestone/diagnose_my_injury/view/step_4.dart';
import 'package:milestone/diagnose_my_injury/view/step_5.dart';
import 'package:milestone/diagnose_my_injury/view/step_6.dart';
import 'package:milestone/utils/utils.dart';

class DiagnoseMyInjuryView extends StatefulWidget {
  const DiagnoseMyInjuryView({super.key});

  @override
  State<DiagnoseMyInjuryView> createState() => _DiagnoseMyInjuryViewState();
}

class _DiagnoseMyInjuryViewState extends State<DiagnoseMyInjuryView> {
  static const _totalSteps = 6;
  int _currentStep = 1;
  Map<String, String> _injuryAnswers = {};
  Map<String, String> _activityAnswers = {};
  Map<String, String> _onsetAnswers = {};

  void _handleBack() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
      return;
    }

    context.pop();
  }

  void _handleContinue() {
    if (_currentStep < _totalSteps) {
      setState(() => _currentStep++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: CommonAppBar(
        title: l10n.homeDiagnoseInjury,
        showBackButton: true,
        onBackPressed: _handleBack,
        //toolbarHeight: 56,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _currentStep / _totalSteps,
                      minHeight: 6,
                      color: colors.secondary,
                      backgroundColor: colors.outlineVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.diagnoseStepProgress(_currentStep, _totalSteps),
                    style: context.bodyDefault(color: colors.primary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _currentStep - 1,
                children: [
                  Step1(onContinue: _handleContinue),
                  Step2(
                    onContinue: _handleContinue,
                    onReviewAnswers: (injury, activity) {
                      _injuryAnswers = injury;
                      _activityAnswers = activity;
                    },
                  ),
                  Step3(
                    onContinue: _handleContinue,
                    onReviewAnswers: (answers) => _onsetAnswers = answers,
                  ),
                  Step4(onContinue: _handleContinue),
                  Step5(onContinue: _handleContinue),
                  Step6(
                    injuryAnswers: _injuryAnswers,
                    activityAnswers: _activityAnswers,
                    onsetAnswers: _onsetAnswers,
                    onFinish: () => context.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
