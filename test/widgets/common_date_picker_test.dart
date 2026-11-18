import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/utils/widgets/common_date_picker.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('selects an allowed date and applies disabled-date theme colors', (tester) async {
    DateTime? selection;
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async {
            selection = await CommonDatePicker.show(
              context: context,
              initialDate: DateTime(2026, 11, 10),
              firstDate: DateTime(2026, 11),
              lastDate: DateTime(2026, 11, 15),
            );
          },
          child: const Text('Open calendar'),
        ),
      ),
    );
    await tester.tap(find.text('Open calendar'));
    await tester.pumpAndSettle();

    final calendarContext = tester.element(find.byType(CalendarDatePicker));
    final theme = Theme.of(calendarContext);
    final dateTheme = DatePickerTheme.of(calendarContext);
    expect(
      dateTheme.dayForegroundColor!.resolve({WidgetState.disabled}),
      theme.colorScheme.onSurface.withValues(alpha: 0.38),
    );
    expect(dateTheme.todayForegroundColor!.resolve({}), Colors.black);

    await tester.tap(find.text('12'));
    await tester.tap(find.text('16'), warnIfMissed: false);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(selection, DateTime(2026, 11, 12));
  });

  testWidgets('cancel returns no selected date', (tester) async {
    DateTime? selection = DateTime(2026, 11, 10);
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async {
            selection = await CommonDatePicker.show(
              context: context,
              initialDate: DateTime(2026, 11, 10),
              firstDate: DateTime(2026, 11),
              lastDate: DateTime(2026, 11, 15),
            );
          },
          child: const Text('Open calendar'),
        ),
      ),
    );
    await tester.tap(find.text('Open calendar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(selection, isNull);
  });
}
