import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/diagnose_my_injury/view/step_6.dart';
import 'package:milestone/diagnose_my_injury/widgets/answer_review_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('renders the supplied answers in three review sections', (tester) async {
    await tester.pumpApp(
      Step6(
        injuryAnswers: const {'Region': 'Shoulder', 'Side': 'Right'},
        activityAnswers: const {'Main activity': 'Running'},
        onsetAnswers: const {'Onset': 'Gradual / insidious'},
        onFinish: () {},
      ),
    );

    expect(find.text('Review Your Answers'), findsOneWidget);
    expect(find.byType(AnswerReviewCard), findsNWidgets(3));
    expect(find.text('Shoulder'), findsOneWidget);
    expect(find.text('Right'), findsOneWidget);
    expect(find.text('Running'), findsOneWidget);
    expect(find.text('Gradual / insidious'), findsOneWidget);
  });

  testWidgets('finish invokes its callback once', (tester) async {
    var finishes = 0;
    await tester.pumpApp(
      Step6(
        injuryAnswers: const {},
        activityAnswers: const {},
        onsetAnswers: const {},
        onFinish: () => finishes++,
      ),
    );
    await tester.tap(find.text('Finish'));
    await tester.pump();

    expect(finishes, 1);
  });

  testWidgets('long answers wrap and missing values have a fallback on mobile', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final longAnswer = List.filled(12, 'Running and weightlifting').join(' ');

    await tester.pumpApp(
      Step6(
        injuryAnswers: const {'Location': '   '},
        activityAnswers: {'Main activity': longAnswer},
        onsetAnswers: const {'Onset': 'Sudden / traumatic'},
        onFinish: () {},
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Not provided'), findsOneWidget);
    expect(find.text(longAnswer), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('Onset'));
    expect(find.text('Onset').hitTestable(), findsOneWidget);
  });
}
