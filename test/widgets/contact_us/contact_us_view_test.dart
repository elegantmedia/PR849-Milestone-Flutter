import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/app/controller/theme.dart';
import 'package:milestone/contact_us/contact_us.dart';
import 'package:milestone/utils/utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  setUp(() {
    GetIt.instance.registerSingleton<ThemeServiceProvider>(ThemeServiceProvider());
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('renders the message form and both contact actions', (tester) async {
    await tester.pumpApp(const ContactUsView());

    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.text('Type your message here'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.text('Call Us'), findsOneWidget);
    expect(find.text('Visit Our Website'), findsOneWidget);
  });

  testWidgets('rejects whitespace without calling the submission callback', (tester) async {
    String? submittedMessage;
    await tester.pumpApp(ContactUsView(onSubmit: (message) => submittedMessage = message));

    await tester.enterText(find.byType(TextFormField), '   ');
    await tester.ensureVisible(find.text('Submit'));
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter your message'), findsOneWidget);
    expect(submittedMessage, isNull);
  });

  testWidgets('submits the trimmed message', (tester) async {
    String? submittedMessage;
    await tester.pumpApp(ContactUsView(onSubmit: (message) => submittedMessage = message));

    await tester.enterText(find.byType(TextFormField), '  Help with my program  ');
    await tester.ensureVisible(find.text('Submit'));
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(submittedMessage, 'Help with my program');
    expect(find.text('Please enter your message'), findsNothing);
  });

  testWidgets('invokes the phone and website callbacks independently', (tester) async {
    var calls = 0;
    var websiteVisits = 0;
    await tester.pumpApp(
      ContactUsView(
        onCallUs: () => calls++,
        onVisitWebsite: () => websiteVisits++,
      ),
    );

    await tester.ensureVisible(find.text('Call Us'));
    await tester.tap(find.text('Call Us'));
    await tester.pump();
    expect(calls, 1);
    expect(websiteVisits, 0);

    await tester.ensureVisible(find.text('Visit Our Website'));
    await tester.tap(find.text('Visit Our Website'));
    await tester.pump();
    expect(calls, 1);
    expect(websiteVisits, 1);
  });

  testWidgets('shows feedback when submission has not been configured', (tester) async {
    await tester.pumpApp(const ContactUsView());
    await tester.enterText(find.byType(TextFormField), 'Help with my program');
    await tester.ensureVisible(find.text('Submit'));
    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Contact actions are not available yet.'), findsOneWidget);
  });

  testWidgets('shows feedback when a contact action has not been configured', (tester) async {
    await tester.pumpApp(const ContactUsView());
    await tester.ensureVisible(find.text('Visit Our Website'));
    await tester.tap(find.text('Visit Our Website'));
    await tester.pump();

    expect(find.text('Contact actions are not available yet.'), findsOneWidget);
  });
}
