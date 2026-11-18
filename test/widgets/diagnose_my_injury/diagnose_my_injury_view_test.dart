import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/app/controller/theme.dart';
import 'package:milestone/diagnose_my_injury/view/diagnose_my_injury_view.dart';
import 'package:milestone/utils/utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  setUp(() {
    GetIt.instance.registerSingleton<ThemeServiceProvider>(ThemeServiceProvider());
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('advances to the review with entered answers and retains them on back', (tester) async {
    await tester.pumpApp(const DiagnoseMyInjuryView());
    expect(find.text('1 / 6'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('2 / 6'), findsOneWidget);

    final location = find.byType(TextFormField).at(0);
    await tester.ensureVisible(location);
    await tester.enterText(location, 'Inside shoulder');
    final activity = find.byType(TextFormField).at(1);
    await tester.ensureVisible(activity);
    await tester.enterText(activity, 'Running and weightlifting');

    for (var step = 3; step <= 6; step++) {
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(find.text('$step / 6'), findsOneWidget);
    }

    expect(find.text('Review Your Answers'), findsOneWidget);
    expect(find.text('Inside shoulder'), findsOneWidget);
    expect(find.text('Running and weightlifting'), findsOneWidget);

    for (var step = 5; step >= 2; step--) {
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(find.text('$step / 6'), findsOneWidget);
    }

    final fields = tester.widgetList<TextFormField>(find.byType(TextFormField)).toList();
    expect(fields[0].controller!.text, 'Inside shoulder');
    expect(fields[1].controller!.text, 'Running and weightlifting');
    expect(tester.takeException(), isNull);
  });
}
