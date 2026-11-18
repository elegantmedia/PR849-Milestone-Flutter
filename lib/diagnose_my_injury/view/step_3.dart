import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step3 extends StatefulWidget {
  const Step3({required this.onContinue, this.onReviewAnswers, super.key});

  final VoidCallback onContinue;
  final ValueChanged<Map<String, String>>? onReviewAnswers;

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final TextEditingController _injuryDateController = TextEditingController();
  final TextEditingController _timeSinceController = TextEditingController(text: '2');

  String? _onset = 'sudden';
  String? _mechanism;
  String? _pop = 'no';
  String? _continuedActivity = 'no';
  String? _swelling = 'no';
  String? _timeUnit = 'weeks';
  String? _recentActivityChange = 'no';
  String? _progression = 'same';
  String? _similarProblems = 'no';

  @override
  void dispose() {
    _injuryDateController.dispose();
    _timeSinceController.dispose();
    super.dispose();
  }

  Future<void> _selectInjuryDate() async {
    FocusScope.of(context).unfocus();
    final today = DateTime.now();
    final date = await CommonDatePicker.show(
      context: context,
      initialDate: today,
      firstDate: DateTime(1900),
      lastDate: today,
    );
    if (date == null || !mounted) return;

    setState(() {
      _injuryDateController.text = '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final onsetOptions = [
      DiagnosisOption(
        'sudden',
        l10n.diagnoseOnsetSudden,
        description: l10n.diagnoseOnsetSuddenDescription,
      ),
      DiagnosisOption(
        'gradual',
        l10n.diagnoseOnsetGradual,
        description: l10n.diagnoseOnsetGradualDescription,
      ),
      DiagnosisOption('unsure', l10n.diagnoseOnsetUnsure),
    ];
    final yesNoOptions = [
      DiagnosisOption('yes', l10n.yes),
      DiagnosisOption('no', l10n.no),
    ];
    final mechanismOptions = [
      DiagnosisOption('sport', l10n.diagnoseMechanismSport),
      DiagnosisOption('fall', l10n.diagnoseMechanismFall),
      DiagnosisOption('twist', l10n.diagnoseMechanismTwist),
      DiagnosisOption('impact', l10n.diagnoseMechanismImpact),
      DiagnosisOption('lifting', l10n.diagnoseMechanismLifting),
      DiagnosisOption('overuse', l10n.diagnoseMechanismOveruse),
      DiagnosisOption('other', l10n.diagnoseMechanismOther),
    ];
    final timeOptions = [
      DiagnosisOption('days', l10n.diagnoseTimeDays),
      DiagnosisOption('weeks', l10n.diagnoseTimeWeeks),
      DiagnosisOption('months', l10n.diagnoseTimeMonths),
    ];
    final progressionOptions = [
      DiagnosisOption('worse', l10n.diagnoseProgressionWorse),
      DiagnosisOption('comesGoes', l10n.diagnoseProgressionComesGoes),
      DiagnosisOption('intermittentConstant', l10n.diagnoseProgressionIntermittentConstant),
      DiagnosisOption('same', l10n.diagnoseProgressionSame),
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
                  l10n.diagnoseStepThreeTitle,
                  style: context.headline3(color: colors.onSurface),
                ),
                const SizedBox(height: 18),
                QuestionField(
                  title: l10n.diagnoseOnsetQuestion,
                  options: onsetOptions,
                  selectedValue: _onset,
                  onSelected: (value) => setState(() => _onset = value),
                ),
                if (_onset == 'gradual') ...[
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseFirstNoticeQuestion,
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextField(
                            controller: _timeSinceController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: CommonDropDown<DiagnosisOption>(
                            items: timeOptions,
                            value: _findOption(timeOptions, _timeUnit),
                            itemLabel: (option) => option.label,
                            onChanged: (option) => setState(() => _timeUnit = option?.value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseRecentActivityQuestion,
                    options: yesNoOptions,
                    selectedValue: _recentActivityChange,
                    onSelected: (value) => setState(() => _recentActivityChange = value),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseProgressionQuestion,
                    options: progressionOptions,
                    selectedValue: _progression,
                    onSelected: (value) => setState(() => _progression = value),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseSimilarProblemsQuestion,
                    options: yesNoOptions,
                    selectedValue: _similarProblems,
                    onSelected: (value) => setState(() => _similarProblems = value),
                  ),
                ] else ...[
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseDateOfInjury,
                    child: CommonTextField(
                      controller: _injuryDateController,
                      hintText: l10n.diagnoseDateHint,
                      readOnly: true,
                      onTap: _selectInjuryDate,
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: colors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseHowHappened,
                    child: CommonDropDown<DiagnosisOption>(
                      items: mechanismOptions,
                      value: _findOption(mechanismOptions, _mechanism),
                      itemLabel: (option) => option.label,
                      hintText: l10n.diagnoseSelect,
                      onChanged: (option) => setState(() => _mechanism = option?.value),
                    ),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnosePopQuestion,
                    options: yesNoOptions,
                    selectedValue: _pop,
                    onSelected: (value) => setState(() => _pop = value),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseContinueActivityQuestion,
                    options: yesNoOptions,
                    selectedValue: _continuedActivity,
                    onSelected: (value) => setState(() => _continuedActivity = value),
                  ),
                  const SizedBox(height: 16),
                  QuestionField(
                    title: l10n.diagnoseSwellingQuestion,
                    options: yesNoOptions,
                    selectedValue: _swelling,
                    onSelected: (value) => setState(() => _swelling = value),
                  ),
                ],
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: colors.secondaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.diagnoseEstimatedStage,
                              style: context.bodyDefault(
                                color: colors.onSecondaryContainer,
                                weight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              l10n.diagnoseStageSubacute,
                              style: context.bodySmall(color: colors.onSecondaryContainer),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: colors.secondary),
                    ],
                  ),
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
              onPressed: () {
                widget.onReviewAnswers?.call({
                  l10n.diagnoseReviewOnset: _findOption(onsetOptions, _onset)?.label ?? '',
                  if (_onset == 'gradual') ...{
                    l10n.diagnoseFirstNoticeQuestion: _timeSinceController.text.trim().isEmpty
                        ? ''
                        : '${_timeSinceController.text.trim()} ${_findOption(timeOptions, _timeUnit)?.label ?? ''}',
                    l10n.diagnoseProgressionQuestion: _findOption(progressionOptions, _progression)?.label ?? '',
                    l10n.diagnoseRecentActivityQuestion: _findOption(yesNoOptions, _recentActivityChange)?.label ?? '',
                    l10n.diagnoseSimilarProblemsQuestion: _findOption(yesNoOptions, _similarProblems)?.label ?? '',
                  } else ...{
                    l10n.diagnoseDateOfInjury: _injuryDateController.text,
                    l10n.diagnoseHowHappened: _findOption(mechanismOptions, _mechanism)?.label ?? '',
                    l10n.diagnosePopQuestion: _findOption(yesNoOptions, _pop)?.label ?? '',
                    l10n.diagnoseContinueActivityQuestion: _findOption(yesNoOptions, _continuedActivity)?.label ?? '',
                    l10n.diagnoseSwellingQuestion: _findOption(yesNoOptions, _swelling)?.label ?? '',
                  },
                });
                widget.onContinue();
              },
              minimumSize: const Size.fromHeight(48),
              textStyle: context.buttonPrimary(color: colors.onPrimary),
            ),
          ),
        ),
      ],
    );
  }

  DiagnosisOption? _findOption(List<DiagnosisOption> options, String? value) {
    for (final option in options) {
      if (option.value == value) return option;
    }
    return null;
  }
}
