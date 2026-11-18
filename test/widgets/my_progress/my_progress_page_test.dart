import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/app/controller/theme.dart';
import 'package:milestone/my_progress/view/my_progress_page.dart';
import 'package:milestone/utils/utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  setUp(() {
    GetIt.instance.registerSingleton<ThemeServiceProvider>(ThemeServiceProvider());
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('renders the statistics and the sample program progress', (tester) async {
    await tester.pumpApp(const MyProgressPage());

    expect(find.text('My Progress'), findsOneWidget);
    for (final label in ['Active Programs', 'Exercises Done', 'Assessments Completed', 'Completed Programs']) {
      expect(find.text(label), findsOneWidget);
    }
    expect(find.text('34'), findsOneWidget);
    expect(find.text('Hamstring Strain Grade 03'), findsOneWidget);
    expect(find.text('2/5 phases completed'), findsOneWidget);
    expect(find.text('40%'), findsOneWidget);
    expect(find.text('Started 02/Jul/2026'), findsOneWidget);
    expect(tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator)).value, 0.4);
  });

  testWidgets('remains scrollable without layout exceptions on a narrow phone', (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const MyProgressPage());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Continue'));

    expect(find.text('Continue').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
