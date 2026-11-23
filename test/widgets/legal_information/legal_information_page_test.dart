import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/app/controller/theme.dart';
import 'package:milestone/legal_information/legal_information.dart';
import 'package:milestone/utils/utils.dart';

import '../../helpers/pump_app.dart';

void main() {
  setUp(() {
    GetIt.instance.registerSingleton<ThemeServiceProvider>(ThemeServiceProvider());
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('renders Terms & Conditions when key is TERMS_AND_CONDITIONS', (tester) async {
    await tester.pumpApp(
      const LegalInformationPage(legalKey: LegalKeys.termsAndConditions),
    );

    expect(find.text('Terms & Conditions'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.textContaining('Lorem ipsum dolor sit amet'), findsOneWidget);
  });

  testWidgets('renders Privacy Policy when key is PRIVACY_POLICY', (tester) async {
    await tester.pumpApp(
      const LegalInformationPage(legalKey: LegalKeys.privacyPolicy),
    );

    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.textContaining('Lorem ipsum dolor sit amet'), findsOneWidget);
  });

  testWidgets('renders using named constructors', (tester) async {
    await tester.pumpApp(
      const LegalInformationPage.privacyPolicy(),
    );
    expect(find.text('Privacy Policy'), findsOneWidget);

    await tester.pumpApp(
      const LegalInformationPage.termsAndConditions(),
    );
    expect(find.text('Terms & Conditions'), findsOneWidget);
  });

  testWidgets('renders custom paragraphs and title when provided', (tester) async {
    await tester.pumpApp(
      const LegalInformationPage(
        legalKey: LegalKeys.termsAndConditions,
        title: 'Custom Terms',
        paragraphs: ['Paragraph 1', 'Paragraph 2'],
      ),
    );

    expect(find.text('Custom Terms'), findsOneWidget);
    expect(find.text('Paragraph 1'), findsOneWidget);
    expect(find.text('Paragraph 2'), findsOneWidget);
  });
}
