import 'package:flutter/material.dart';
import 'package:milestone/app/app.dart';
import 'package:milestone/auth/auth.dart';
import 'package:milestone/change_password/view/change_password.dart';
import 'package:milestone/contact_us/contact_us.dart';
import 'package:milestone/diagnose_my_injury/diagnose_my_injury.dart';
import 'package:milestone/home/home.dart';
import 'package:milestone/legal_information/legal_information.dart';
import 'package:milestone/more/more.dart';
import 'package:milestone/my_progress/my_progress.dart';
import 'package:milestone/profile/profile.dart';
import 'package:milestone/utils/utils.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

enum RouterAuthState {
  notInitialized,
  notLoggedIn,
  notVerified,
  authenticated,
}

class AppRouter {
  AppRouter();

  final AppStates _appStates = GetIt.instance<AppStates>();

  GoRouter get goRouter => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: _appStates,
    initialLocation: '${_appStates.homePrefix}/${Pages.home.toPath(isSubRoute: true)}',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.splash.toPath(),
        name: Pages.splash.toPathName(),
        pageBuilder: (context, state) => const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        path: Pages.intro.toPath(),
        name: Pages.intro.toPathName(),
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const IntroPage(),
        ),
        routes: [
          GoRoute(
            path: Pages.signIn.toPath(isSubRoute: true),
            name: Pages.signIn.toPathName(),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SignInPage(),
            ),
            routes: [
              GoRoute(
                path: Pages.forgotPassword.toPath(isSubRoute: true),
                name: Pages.forgotPassword.toPathName(),
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const ForgotPassword(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: Pages.signUp.toPath(isSubRoute: true),
            name: Pages.signUp.toPathName(),
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SignUpPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: Pages.verify.toPath(),
        name: Pages.verify.toPathName(),
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const CodeVerificationPage(),
        ),
      ),
     
      StatefulShellRoute.indexedStack(
        builder: (context, state, statefulNavigationShell) => ShellController(navigationShell: statefulNavigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.home.toPath(pathPrefix: _appStates.homePrefix),
                name: Pages.home.toPathName(),
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                ),
                routes: [
                  GoRoute(
                    path: Pages.diagnoseMyInjury.toPath(isSubRoute: true),
                    name: Pages.diagnoseMyInjury.toPathName(),
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const DiagnoseMyInjuryView(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.chat.toPath(pathPrefix: _appStates.homePrefix),
                name: Pages.chat.toPathName(),
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: Scaffold(
                    appBar: const CommonAppBar(
                      content: CommonAppBarContent.logo,
                    ),
                    body: Center(
                      child: Text(context.l10n.programs),
                    ),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.explore.toPath(pathPrefix: _appStates.homePrefix),
                name: Pages.explore.toPathName(),
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MyProgressPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.more.toPath(pathPrefix: _appStates.homePrefix),
                name: Pages.more.toPathName(),
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MorePage(),
                ),
                routes: [
                  GoRoute(
                    path: Pages.profile.toPath(isSubRoute: true),
                    name: Pages.profile.toPathName(),
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const MyProfilePage(),
                    ),
                    routes: [
                      GoRoute(
                        path: Pages.changePassword.toPath(isSubRoute: true),
                        name: Pages.changePassword.toPathName(),
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey,
                          child: const ChangePasswordPage(),
                        ),
                      ),
                      GoRoute(
                        path: Pages.editProfile.toPath(isSubRoute: true),
                        name: Pages.editProfile.toPathName(),
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) {
                          final profile = GetIt.instance<UserProfileService>().userProfile;

                          return MaterialPage(
                            key: state.pageKey,
                            child: EditProfilePage(
                              firstName: profile?.firstName ?? '',
                              lastName: profile?.lastName ?? '',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Pages.contactUs.toPath(isSubRoute: true),
                    name: Pages.contactUs.toPathName(),
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const ContactUsView(),
                    ),
                  ),
                  GoRoute(
                    path: Pages.settings.toPath(isSubRoute: true),
                    name: Pages.settings.toPathName(),
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const SettingsPage(),
                    ),
                  ),
                  GoRoute(
                    path: Pages.legalInformation.toPath(isSubRoute: true),
                    name: Pages.legalInformation.toPathName(),
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      final key = state.uri.queryParameters['key'] ?? (state.extra as String?) ?? LegalKeys.termsAndConditions;
                      return MaterialPage(
                        key: state.pageKey,
                        child: LegalInformationPage(legalKey: key),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Determine current auth state
      final currentState = _determineAuthState();

      // Define routing rules map
      final routingRules = {
        RouterAuthState.notInitialized: Pages.splash,
        RouterAuthState.notLoggedIn: Pages.intro,
        RouterAuthState.notVerified: Pages.verify,
        RouterAuthState.authenticated: Pages.home,
      };

      // Get target page for current auth state
      final targetPage = routingRules[currentState] ?? Pages.splash;

      // For authenticated state, only check if path starts with homePrefix
      // For other states, ensure exact path match
      if (currentState == RouterAuthState.authenticated) {
        if (!state.matchedLocation.startsWith(_appStates.homePrefix)) {
          final targetPath = state.namedLocation(targetPage.toPathName());
          return targetPath;
        }
      } else {
        final targetPath = state.namedLocation(targetPage.toPathName());
        if (!state.matchedLocation.startsWith(targetPath)) {
          return targetPath;
        }
      }

      return null;
    },
  );

  // Helper method to determine current auth state
  RouterAuthState _determineAuthState() {
    if (!_appStates.isInitialized) return RouterAuthState.notInitialized;
    if (!_appStates.isLogin) return RouterAuthState.notLoggedIn;
    if (!_appStates.isCodeVerified) return RouterAuthState.notVerified;
    return RouterAuthState.authenticated;
  }
}
