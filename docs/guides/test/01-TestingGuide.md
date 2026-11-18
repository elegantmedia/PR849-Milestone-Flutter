# Testing and CI

## Local checks

Use Flutter 3.47.8 (Dart 3.13.7), matching CI:

```sh
flutter pub get --enforce-lockfile
flutter analyze --no-pub --no-fatal-infos
flutter test --no-pub
```

The lockfile is the dependency source of truth. Do not upgrade dependencies as part of running tests. Widget tests use the shared pump helper, localisations, and ScreenUtil; they do not call production bootstrap, real APIs, or secure storage.

The real app entry points are `lib/main_development.dart`, `lib/main_staging.dart`, and `lib/main_production.dart`, which call `bootstrap`. The separate `lib/main.dart` currently launches a placeholder app and is not a full-app test target.

## Test layout

- `test/widgets/contact_us/`: Contact Us rendering, validation, submission callbacks, and unavailable-action feedback.
- `test/widgets/diagnose_my_injury/`: questionnaire navigation and answer retention, Step 3 conditional questions, Step 6 review, text-question input limits, and pain-rating controls.
- `test/widgets/home/`: action-card and arrow callbacks, including disabled actions.
- `test/widgets/my_progress/`: sample statistics, localised program details, and narrow-screen layout.
- `test/widgets/common_button_test.dart`: shared button rendering, interaction, loading, and disabled states.
- `test/widgets/common_date_picker_test.dart`: calendar selection, disabled dates, theme colours, and cancellation.
- `test/widgets/autofill_form_fields_test.dart`: existing shared form and autofill tests.
- `test/helpers/`: shared pump and test-data helpers.
- `test/controllers/`, `test/models/`, `test/services/`: existing non-widget tests.

Name new widget tests after the feature screen or reusable widget. Prefer observable behaviour and callbacks over implementation details. Use small viewport tests for layout risks. Dispose controllers, service registrations, and semantics handles. In this SDK, semantics handles must be disposed inside the test body, before end-of-test verification.

## Analyzer baseline

The project now inherits the installed `very_good_analysis` version-11 preset. Existing project-specific rule overrides and platform exclusions are preserved. The preset retains strict casts, inference, and raw-type checks and adds checks including async return handling and simpler directive paths.

Verification on 18/Nov/2026 found zero analyzer errors and warnings, with 104 informational findings in existing code:

| Rule | Count |
| --- | ---: |
| `simple_directive_paths` | 85 |
| `async_return_with_no_await` | 17 |
| `unnecessary_import` | 1 |
| `unnecessary_ignore` | 1 |

Before this change, the version-10 preset reported the single `unnecessary_import` finding in Step 2. The newer preset exposes the other legacy findings without requiring unrelated cleanup. CI deliberately retains `--no-fatal-infos`: errors and warnings fail the job, while informational findings remain visible. Bare `flutter analyze` can exit nonzero because of these infos.

## CI

`.github/workflows/flutter-ci.yml` is the only workflow. It runs on pull requests and pushes targeting `main` or `development`, and can also be started manually. It installs the pinned Flutter SDK, enforces the lockfile, analyses Dart, and runs all tests. It does not build artifacts, publish releases, or contact app stores.

Flutter tests bundle the development environment asset declared in the pubspec. Since real env files are ignored, CI generates that asset using dummy values and an `example.invalid` API host. It does not need real credentials and does not modify developers' local env files.

The workflow YAML was parsed with Ruby Psych and checked for the exact target branches, the single-workflow constraint, lockfile enforcement, and analyzer/test steps. A GitHub-hosted run has not been executed locally.

## Verification and gaps

The complete suite passes 73 cases, including 28 added behaviour-focused cases. Two existing auth startup-restoration failures were repaired by stubbing the API settings required by their mock fixture; production auth behaviour was not changed. Locked dependency installation leaves `pubspec.lock` unchanged.

This is not full screen or line coverage. Remaining gaps include:

- Authentication screens and their complete network-driven loading/error flows, splash, onboarding, profile completion/editing, password changes, More, and settings screens.
- The full Home screen and program-progress empty/active states; only its action card has new focused tests.
- Detailed per-question validation and answer collection across every diagnosis step. The flow regression visits all six steps but is not exhaustive screen coverage.
- Real Contact Us submission, external phone/website launching, backend program matching, persistence, platform plugins, and device integration.
- Several pre-existing service tests are example/pattern cases with no behaviour assertions. Their passing status is not evidence that those service paths are covered.

No placeholder cases were added. No coverage percentage is claimed; run `flutter test --coverage` separately when measuring line coverage.