import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/diagnose_my_injury/widgets/text_question_feild.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('renders a title, description, and custom hint', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    await tester.pumpApp(
      TextQuestionField(
        title: 'Location',
        description: 'Describe the exact location',
        hintText: 'Maximum 400 characters',
        controller: controller,
      ),
    );

    expect(find.text('Location'), findsOneWidget);
    expect(find.text('Describe the exact location'), findsOneWidget);
    expect(find.text('Maximum 400 characters'), findsOneWidget);
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.minLines, 4);
    expect(field.maxLines, 4);
  });

  testWidgets('enforces its character limit while accepting multiline input', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    await tester.pumpApp(
      TextQuestionField(title: 'Location', controller: controller, maxLength: 400),
    );

    await tester.enterText(find.byType(TextFormField), List.filled(401, 'a').join());
    expect(controller.text.length, 400);

    await tester.enterText(find.byType(TextFormField), 'First line\nSecond line');
    expect(controller.text, 'First line\nSecond line');
  });

  testWidgets('uses the localized default hint when no custom hint is provided', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    await tester.pumpApp(TextQuestionField(title: 'Message', controller: controller));

    expect(find.text('Type here...'), findsOneWidget);
  });
}
