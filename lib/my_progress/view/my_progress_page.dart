import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/my_progress/widget/my_progress_card.dart';
import 'package:milestone/utils/utils.dart';

class MyProgressPage extends StatelessWidget {
  const MyProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final startDate = DateFormat('dd/MMM/yyyy', locale).format(DateTime(2026, 7, 2));
    final percentage = NumberFormat.percentPattern(locale).format(0.4);

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.myProgress, style: context.headline1()),
              const SizedBox(height: 24),
              ProgressStatistic(
                icon: Icons.menu_book_outlined,
                iconColor: colors.secondary,
                label: l10n.progressActivePrograms,
                count: 2,
              ),
              const SizedBox(height: 16),
              ProgressStatistic(
                icon: Icons.fitness_center,
                iconColor: const Color(0xFF4A60B2),
                label: l10n.progressExercisesDone,
                count: 34,
              ),
              const SizedBox(height: 16),
              ProgressStatistic(
                icon: Icons.description,
                iconColor: context.themeColors.warningColor,
                label: l10n.progressAssessmentsCompleted,
                count: 4,
              ),
              const SizedBox(height: 16),
              ProgressStatistic(
                icon: Icons.check_circle,
                iconColor: context.themeColors.successColor,
                label: l10n.progressCompletedPrograms,
                count: 1,
              ),
              const SizedBox(height: 18),
              Card(
                margin: EdgeInsets.zero,
                color: colors.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: colors.outlineVariant),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.progressProgramName,
                        style: context.bodyLarge(),
                      ),
                      const SizedBox(height: 14),
                      LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 4,
                        borderRadius: BorderRadius.circular(4),
                        color: colors.secondary,
                        backgroundColor: colors.outlineVariant,
                        semanticsLabel: l10n.progressProgramName,
                        semanticsValue: percentage,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              l10n.progressPhasesCompleted(2, 5),
                              style: context.bodyDefault(color: colors.onSurfaceVariant),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(percentage, style: context.bodyDefault()),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            l10n.progressStarted(startDate),
                            style: context.bodySmall(),
                          ),
                          SizedBox(
                            width: 160,
                            child: CommonButton.primary(
                              label: l10n.continueAction,
                              onPressed: () => Pages.chat.go(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
