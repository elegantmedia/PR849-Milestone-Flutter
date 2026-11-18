import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/diagnose_my_injury/view/step_3.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('sudden onset shows only immediate-injury questions', (tester) async {
    await tester.pumpApp(Step3(onContinue: () {}));

    expect(find.text('Date of injury'), findsOneWidget);
    expect(find.text('How did it happen?'), findsOneWidget);
    expect(find.text('Did it swell within 24 hours?'), findsOneWidget);
    expect(find.text('When did you first notice it?'), findsNothing);
    expect(find.text('How has it progressed?'), findsNothing);
  });

  testWidgets('gradual onset replaces immediate-injury questions with follow-ups', (tester) async {
    await tester.pumpApp(Step3(onContinue: () {}));
    await tester.tap(find.text('Gradual / insidious'));
    await tester.pumpAndSettle();

    expect(find.text('When did you first notice it?'), findsOneWidget);
    expect(find.text('How has it progressed?'), findsOneWidget);
    expect(find.text('Have you had similar problems in this same area before?'), findsOneWidget);
    expect(find.text('Date of injury'), findsNothing);
    expect(find.text('How did it happen?'), findsNothing);
    expect(find.text('Did it swell within 24 hours?'), findsNothing);
  });

  testWidgets('switching branches preserves the entered timing', (tester) async {
    await tester.pumpApp(Step3(onContinue: () {}));
    await tester.tap(find.text('Gradual / insidious'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), '12');

    await tester.ensureVisible(find.text('Sudden / traumatic'));
    await tester.tap(find.text('Sudden / traumatic'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gradual / insidious'));
    await tester.pumpAndSettle();

    expect(tester.widget<TextFormField>(find.byType(TextFormField)).controller!.text, '12');
    expect(find.text('Date of injury'), findsNothing);
  });

  testWidgets('unsure onset uses the immediate-injury branch without gradual follow-ups', (tester) async {
    await tester.pumpApp(Step3(onContinue: () {}));
    await tester.tap(find.text('Not sure / mixed'));
    await tester.pumpAndSettle();

    expect(find.text('Date of injury'), findsOneWidget);
    expect(find.text('When did you first notice it?'), findsNothing);
    expect(find.text('How has it progressed?'), findsNothing);
  });

  testWidgets('continue reports answers only for the selected branch', (tester) async {
    Map<String, String>? answers;
    var continued = false;
    await tester.pumpApp(
      Step3(
        onContinue: () => continued = true,
        onReviewAnswers: (value) => answers = value,
      ),
    );
    await tester.tap(find.text('Gradual / insidious'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(continued, isTrue);
    expect(answers!['Onset'], 'Gradual / insidious');
    expect(answers!['When did you first notice it?'], '2 weeks ago');
    expect(answers, isNot(contains('Date of injury')));
  });
}
