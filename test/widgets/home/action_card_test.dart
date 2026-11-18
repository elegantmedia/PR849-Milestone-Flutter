import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/home/widgets/action_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('the card and arrow each invoke the action exactly once', (tester) async {
    var taps = 0;
    await tester.pumpApp(
      Row(
        children: [
          ActionCard(
            icon: Icons.medical_services,
            color: Colors.amber,
            label: 'Diagnose My Injury',
            onTap: () => taps++,
          ),
        ],
      ),
    );

    await tester.tap(find.text('Diagnose My Injury'));
    await tester.pump();
    expect(taps, 1);
    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pump();
    expect(taps, 2);
  });

  testWidgets('an unconfigured action has a disabled arrow', (tester) async {
    await tester.pumpApp(
      const Row(
        children: [
          ActionCard(icon: Icons.menu_book, color: Colors.blue, label: 'Programs'),
        ],
      ),
    );

    expect(tester.widget<IconButton>(find.byType(IconButton)).onPressed, isNull);
  });
}
