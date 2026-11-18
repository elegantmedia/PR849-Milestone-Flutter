import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/model/model.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step2 extends StatefulWidget {
  const Step2({required this.onContinue, this.onReviewAnswers, super.key});

  final VoidCallback onContinue;
  final void Function(Map<String, String> injury, Map<String, String> activity)? onReviewAnswers;

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();

  String? _bodyRegion;
  String? _side = 'left';
  String? _physicalDemand;
  String? _trainingFrequency;

  @override
  void dispose() {
    _locationController.dispose();
    _activityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final bodyRegions = [
      DiagnosisOption('head', l10n.diagnoseRegionHead),
      DiagnosisOption('neck', l10n.diagnoseRegionNeck),
      DiagnosisOption('shoulder', l10n.diagnoseRegionShoulder),
      DiagnosisOption('upperArm', l10n.diagnoseRegionUpperArm),
      DiagnosisOption('elbow', l10n.diagnoseRegionElbow),
      DiagnosisOption('forearm', l10n.diagnoseRegionForearm),
      DiagnosisOption('wrist', l10n.diagnoseRegionWrist),
      DiagnosisOption('hand', l10n.diagnoseRegionHand),
      DiagnosisOption('chest', l10n.diagnoseRegionChest),
      DiagnosisOption('upperBack', l10n.diagnoseRegionUpperBack),
      DiagnosisOption('lowerBack', l10n.diagnoseRegionLowerBack),
      DiagnosisOption('hip', l10n.diagnoseRegionHip),
      DiagnosisOption('thigh', l10n.diagnoseRegionThigh),
      DiagnosisOption('knee', l10n.diagnoseRegionKnee),
      DiagnosisOption('lowerLeg', l10n.diagnoseRegionLowerLeg),
      DiagnosisOption('ankle', l10n.diagnoseRegionAnkle),
      DiagnosisOption('foot', l10n.diagnoseRegionFoot),
    ];
    final sideOptions = [
      DiagnosisOption('left', l10n.diagnoseSideLeft),
      DiagnosisOption('right', l10n.diagnoseSideRight),
      DiagnosisOption('both', l10n.diagnoseSideBoth),
      DiagnosisOption('notApplicable', l10n.diagnoseSideNotApplicable),
    ];
    final demandOptions = [
      DiagnosisOption('sedentary', l10n.diagnoseDemandSedentary),
      DiagnosisOption('rehabilitation', l10n.diagnoseDemandRehabilitation),
      DiagnosisOption('lightDaily', l10n.diagnoseDemandLightDaily),
      DiagnosisOption('recreational', l10n.diagnoseDemandRecreational),
      DiagnosisOption('competitive', l10n.diagnoseDemandCompetitive),
      DiagnosisOption('manual', l10n.diagnoseDemandManual),
    ];
    final frequencyOptions = [
      DiagnosisOption('none', l10n.diagnoseFrequencyNone),
      DiagnosisOption('oneToTwo', l10n.diagnoseFrequencyOneToTwo),
      DiagnosisOption('threeToFour', l10n.diagnoseFrequencyThreeToFour),
      DiagnosisOption('fiveOrMore', l10n.diagnoseFrequencyFiveOrMore),
    ];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: colors.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: colors.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.diagnoseStepTwoTitle,
                          style: context.headline3(color: colors.onSurface),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.diagnoseStepTwoDescription,
                          style: context.bodySmall(color: colors.onSurface),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                QuestionField(
                  title: l10n.diagnoseBodyRegionLabel,
                  child: CommonDropDown<DiagnosisOption>(
                    items: bodyRegions,
                    value: _findOption(bodyRegions, _bodyRegion),
                    itemLabel: (option) => option.label,
                    hintText: l10n.diagnoseSelectRegion,
                    onChanged: (option) => setState(() => _bodyRegion = option?.value),
                  ),
                ),
                const SizedBox(height: 16),
                QuestionField(
                  title: l10n.diagnoseSideLabel,
                  options: sideOptions,
                  selectedValue: _side,
                  onSelected: (value) => setState(() => _side = value),
                ),
                const SizedBox(height: 16),
                TextQuestionField(
                  controller: _locationController,
                  title: l10n.diagnoseSpecificLocationLabel,
                  description: l10n.diagnoseSpecificLocationDescription,
                  // hintText: l10n.diagnoseSpecificLocationHint,
                  maxLength: 400,
                ),
                const SizedBox(height: 16),
                TextQuestionField(
                  controller: _activityController,
                  title: l10n.diagnoseMainSportLabel,
                  description: l10n.diagnoseMainSportDescription,
                  hintText: l10n.diagnoseMainSportHint,
                ),
                const SizedBox(height: 16),
                QuestionField(
                  title: l10n.diagnosePhysicalDemandsLabel,
                  options: demandOptions,
                  selectedValue: _physicalDemand,
                  onSelected: (value) => setState(() => _physicalDemand = value),
                ),
                const SizedBox(height: 16),
                QuestionField(
                  title: l10n.diagnoseTrainingFrequencyLabel,
                  child: CommonDropDown<DiagnosisOption>(
                    items: frequencyOptions,
                    value: _findOption(frequencyOptions, _trainingFrequency),
                    itemLabel: (option) => option.label,
                    hintText: l10n.diagnoseSelect,
                    onChanged: (option) => setState(() => _trainingFrequency = option?.value),
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
                widget.onReviewAnswers?.call(
                  {
                    l10n.diagnoseReviewRegion: _findOption(bodyRegions, _bodyRegion)?.label ?? '',
                    l10n.diagnoseSideLabel: _findOption(sideOptions, _side)?.label ?? '',
                    l10n.diagnoseReviewLocation: _locationController.text.trim(),
                  },
                  {
                    l10n.diagnoseReviewMainActivity: _activityController.text.trim(),
                    l10n.diagnoseReviewDemands: _findOption(demandOptions, _physicalDemand)?.label ?? '',
                    l10n.diagnoseReviewFrequency: _findOption(frequencyOptions, _trainingFrequency)?.label ?? '',
                  },
                );
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
