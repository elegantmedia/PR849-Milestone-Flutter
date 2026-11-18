
import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    required this.hasActiveProgram,
    required this.title,
    required this.injury,
    required this.progressLabel,
    required this.phase,
    required this.nextSession,
    super.key,
  });

  final bool hasActiveProgram;
  final String title;
  final String injury;
  final String progressLabel;
  final String phase;
  final String nextSession;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    if (!hasActiveProgram) {
      final l10n = context.l10n;

      return Card(
        color: colors.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: colors.outlineVariant),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 18),
          child: Column(
            children: [
              const CommonAssetImage(
                assetPath: AppImages.emptyState,
                width: 64,
                height: 64,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.homeNoActivePrograms,
                textAlign: TextAlign.center,
                style: context.headline2(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.homeStartProgramPrompt,
                textAlign: TextAlign.center,
                style: context.bodyLarge(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child:CommonButton.primary(
                  label: l10n.homeDiagnoseInjury,
                  onPressed: (){},
                ),
                // child: ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: colors.primary,
                //     foregroundColor: colors.onPrimary,
                //     minimumSize: const Size.fromHeight(70),
                //   ),
                //   child: Text(
                //     l10n.homeDiagnoseInjury,
                //     style: context.buttonPrimary(color: colors.onPrimary),
                //   ),
                
              ),
            ],
          ),
        ),
      );
    }

    return Card(
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
            Text(title, style: context.headline4(color: colors.secondary)),
            const SizedBox(height: 6),
            Text(injury, style: context.headline2()),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      minHeight: 12,
                      color: colors.secondary,
                      backgroundColor: colors.outlineVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(progressLabel, style: context.bodyDefault(weight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 18),
            Text(phase, style: context.bodyDefault()),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CommonButton.primary(
                label: nextSession,
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
