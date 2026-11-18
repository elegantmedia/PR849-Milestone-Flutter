import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class AnswerReviewCard extends StatelessWidget {
  const AnswerReviewCard({
    required this.title,
    required this.answers,
    super.key,
  });

  final String title;
  final Map<String, String> answers;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final entries = answers.entries.toList();

    return Card(
      margin: EdgeInsets.zero,
      color: colors.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: context.headline2()),
            const SizedBox(height: 18),
            for (var index = 0; index < entries.length; index++) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(entries[index].key, style: context.bodyDefault()),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Text(
                      entries[index].value.trim().isEmpty ? context.l10n.notProvided : entries[index].value,
                      textAlign: TextAlign.end,
                      style: context.bodyLarge(weight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              if (index < entries.length - 1) const SizedBox(height: 18),
            ],
          ],
        ),
      ),
    );
  }
}
