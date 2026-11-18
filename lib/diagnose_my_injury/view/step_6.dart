import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/diagnose_my_injury/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class Step6 extends StatelessWidget {
  const Step6({
    required this.injuryAnswers,
    required this.activityAnswers,
    required this.onsetAnswers,
    required this.onFinish,
    super.key,
  });

  final Map<String, String> injuryAnswers;
  final Map<String, String> activityAnswers;
  final Map<String, String> onsetAnswers;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.diagnoseReviewTitle, style: context.headlineTitle()),
                const SizedBox(height: 24),
                Text(
                  l10n.diagnoseReviewDescription,
                  style: context.bodyLarge(weight: FontWeight.w700),
                ),
                const SizedBox(height: 24),
                AnswerReviewCard(
                  title: l10n.diagnoseReviewInjury,
                  answers: injuryAnswers,
                ),
                const SizedBox(height: 18),
                AnswerReviewCard(
                  title: l10n.diagnoseReviewActivity,
                  answers: activityAnswers,
                ),
                const SizedBox(height: 18),
                AnswerReviewCard(
                  title: l10n.diagnoseStepThreeTitle,
                  answers: onsetAnswers,
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
              label: l10n.diagnoseFinish,
              onPressed: onFinish,
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ),
      ],
    );
  }
}
