import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milestone/app/controller/theme.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/more/view/settings.dart';
import 'package:milestone/profile/profile.dart';
import 'package:milestone/utils/utils.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class MockUserProfileService extends Mock implements UserProfileService {}

class MockAuthService extends Mock implements AuthService {}

void main() {
  late MockUserProfileService mockUserProfileService;
  late MockAuthService mockAuthService;

  setUp(() {
    mockUserProfileService = MockUserProfileService();
    mockAuthService = MockAuthService();

    GetIt.instance.registerSingleton<ThemeServiceProvider>(ThemeServiceProvider());
    GetIt.instance.registerSingleton<UserProfileService>(mockUserProfileService);
    GetIt.instance.registerSingleton<AuthService>(mockAuthService);

    when(() => mockUserProfileService.deleteUserAccount()).thenAnswer((_) async {});
    when(() => mockAuthService.onUserProfileDeleted()).thenAnswer((_) async {});
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('renders App Settings and Delete Account button', (tester) async {
    await tester.pumpApp(const SettingsPage());

    expect(find.text('App Settings'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.text('Delete Account'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('tapping Delete Account shows confirmation dialog', (tester) async {
    await tester.pumpApp(const SettingsPage());

    await tester.tap(find.text('Delete Account'));
    await tester.pumpAndSettle();

    expect(find.text('Delete Account?'), findsOneWidget);
    expect(find.text('You won’t be able to undo this action.'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);
  });

  testWidgets('tapping Cancel in dialog dismisses dialog without deleting', (tester) async {
    await tester.pumpApp(const SettingsPage());

    await tester.tap(find.text('Delete Account'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.text('Delete Account?'), findsNothing);
    verifyNever(() => mockUserProfileService.deleteUserAccount());
    verifyNever(() => mockAuthService.onUserProfileDeleted());
  });

  testWidgets('tapping Delete in dialog calls deleteUserAccount and onUserProfileDeleted', (tester) async {
    await tester.pumpApp(const SettingsPage());

    await tester.tap(find.text('Delete Account'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    verify(() => mockUserProfileService.deleteUserAccount()).called(1);
    verify(() => mockAuthService.onUserProfileDeleted()).called(1);
  });
}
