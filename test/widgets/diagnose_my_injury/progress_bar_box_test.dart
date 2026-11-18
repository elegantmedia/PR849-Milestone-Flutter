import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/diagnose_my_injury/widgets/progress_bar_box.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('renders the current rating and accessible slider label', (tester) async {
    final semantics = tester.ensureSemantics();
    try {
      await tester.pumpApp(ProgressBarBox(title: 'Pain right now', value: 3, onChanged: (_) {}));

      expect(find.text('Pain right now'), findsOneWidget);
      expect(find.text('3/10'), findsOneWidget);
      expect(tester.widget<Slider>(find.byType(Slider)).divisions, 10);
      expect(find.bySemanticsLabel(RegExp('Pain right now')), findsWidgets);
    } finally {
      semantics.dispose();
    }
  });

  testWidgets('interacting with the slider updates its controlled rating', (tester) async {
    var rating = 2.0;
    await tester.pumpApp(
      StatefulBuilder(
        builder: (context, setState) => ProgressBarBox(
          title: 'Pain right now',
          value: rating,
          onChanged: (value) => setState(() => rating = value),
        ),
      ),
    );
    await tester.tap(find.byType(Slider));
    await tester.pumpAndSettle();

    expect(rating, isNot(2));
    expect(rating, inInclusiveRange(0, 10));
    expect(find.text('${rating.round()}/10'), findsOneWidget);
  });

  test('rejects ratings outside the supported scale', () {
    for (final value in [-1.0, 11.0, double.nan]) {
      expect(
        () => ProgressBarBox(title: 'Pain', value: value, onChanged: (_) {}),
        throwsAssertionError,
      );
    }
  });
}
