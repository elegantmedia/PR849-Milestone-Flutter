import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/utils/utils.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_data.dart';

/// Mock classes
class MockBox extends Mock implements Box<String> {}

class MockAppSettings extends Mock implements AppSettings {}

class MockConnectivityService extends Mock implements ConnectivityService {}

/// Example test for StreamController-based service.
///
/// This demonstrates how to:
/// - Test services that use StreamController
/// - Mock repository calls
/// - Verify stream emissions
/// - Test async operations
void main() {
  // late AuthService authService; // Unused - example patterns only
  // late MockAuthRepository mockRepository; // Unused - example patterns only
  late MockBox mockBox;
  late MockAppSettings mockAppSettings;
  late GetIt getIt;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(
      LogInRequestModel(
        email: testEmail,
        password: testPassword,
        deviceId: 'test',
        deviceType: 'iOS',
      ),
    );
  });

  setUp(() async {
    // Setup GetIt
    getIt = GetIt.instance;
    await getIt.reset();

    // Create mocks
    mockAppSettings = MockAppSettings();
    mockBox = MockBox();

    // Setup mock returns
    when(() => mockAppSettings.sessionSecretKey).thenReturn('test_key');
    when(() => mockAppSettings.baseUrl).thenReturn('https://example.invalid');
    when(() => mockAppSettings.apiKey).thenReturn('test-api-key');

    // Register mocks in GetIt
    getIt.registerSingleton<AppSettings>(mockAppSettings);

    // Initialize Hive for testing
    Hive.init('./test/temp');

    // Note: In a real test, you would need to properly mock or open the Hive box
    // For this example, we're showing the pattern
    // You may need to use flutter_test and proper Hive test setup
  });

  tearDown(() async {
    await getIt.reset();
  });

  group('AuthService - Stream Testing', () {
    test('should emit AuthLoading then AuthSuccess on successful login', () async {
      // This is a conceptual example showing the pattern
      // In reality, you would need to properly initialize the service with mocked dependencies

      // Arrange - Setup mock repository to return success
      // final mockProfile = UserProfileWithToken.fromJson(mockUserProfileWithTokenJson);

      // Expected stream emissions (example pattern)
      // final expectedStates = [
      //   isA<AuthLoading>(),
      //   isA<AuthSuccess>(),
      // ];

      // This shows the PATTERN for testing streams
      // In actual implementation, you would:
      // 1. Create the service with mocked dependencies
      // 2. Listen to the stream
      // 3. Call the method
      // 4. Verify emissions using expectLater

      // Example pattern:
      // expectLater(
      //   authService.onAuthStateChanges,
      //   emitsInOrder(expectedStates),
      // );
      // await authService.login(testEmail, testPassword);
    });

    test('should emit AuthFailed on login error', () async {
      // Arrange - Mock to throw error
      // Act - Call login with invalid credentials
      // Assert - Verify AuthFailed is emitted

      // This demonstrates the pattern for testing error cases
    });

    test('should store session token in Hive on successful login', () async {
      // This shows how to verify Hive storage calls
      // when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // After successful login:
      // verify(() => mockBox.put('session', testToken)).called(1);
    });
  });

  group('AuthService - Startup Session Restoration', () {
    late Directory temporaryDirectory;
    late Box<String> sessionBox;

    setUp(() async {
      temporaryDirectory = await Directory.systemTemp.createTemp('auth_session_test_');
      sessionBox = await Hive.openBox<String>('test_key', path: temporaryDirectory.path);
    });

    tearDown(() async {
      await sessionBox.close();
      await temporaryDirectory.delete(recursive: true);
    });

    test('should not restore an unverified session on startup', () async {
      final savedSession = jsonEncode({
        ...mockUserProfileWithTokenJson,
        'is_email_verified': false,
      });
      await sessionBox.put('session', savedSession);
      final service = AuthService();
      final stateExpectation = expectLater(service.onAuthStateChanges, emits(isA<AuthInitial>()));

      await service.refreshSession();
      await stateExpectation;

      expect(sessionBox.get('session'), savedSession);
    });

    test('should still attempt to restore a verified session', () async {
      await sessionBox.put('session', jsonEncode(mockUserProfileWithTokenJson));
      final connectivity = MockConnectivityService();
      when(connectivity.hasConnectivity).thenAnswer((_) async => false);
      getIt.registerSingleton<ConnectivityService>(connectivity);
      final service = AuthService();
      final stateExpectation = expectLater(service.onAuthStateChanges, emits(isA<AuthNoConnectivity>()));

      await service.refreshSession();
      await stateExpectation;

      verify(connectivity.hasConnectivity).called(1);
      expect(sessionBox.get('session'), isNotNull);
    });
  });

  group('AuthService - Session Management', () {
    test('should check if session exists', () {
      // Arrange
      when(() => mockBox.containsKey('session')).thenReturn(true);

      // Act & Assert - Pattern for checking session
      // final hasSession = authService.hasSession;
      // expect(hasSession, true);
    });

    test('should clear session on logout', () async {
      // Setup mock
      when(() => mockBox.clear()).thenAnswer((_) async => 0);

      // Pattern for testing logout:
      // await authService.logout();
      // verify(() => mockBox.clear()).called(1);
    });
  });
}

/// IMPORTANT NOTES FOR DEVELOPERS:
///
/// 1. This is a PATTERN EXAMPLE showing how to structure your tests
/// 2. Complete implementation requires:
///    - Proper Hive test setup (use HiveTestHelper or similar)
///    - Mocking the full dependency tree
///    - Creating testable constructors in AuthService
///
/// 3. Key patterns demonstrated:
///    - How to mock repositories
///    - How to test streams with expectLater
///    - How to verify method calls with mocktail
///    - How to test async operations
///
/// 4. To make AuthService fully testable, consider:
///    - Adding a constructor that accepts dependencies
///    - Extracting Hive box access to a separate class
///    - Using dependency injection for all external dependencies
