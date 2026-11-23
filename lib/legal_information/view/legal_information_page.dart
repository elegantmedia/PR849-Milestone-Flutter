import 'package:flutter/material.dart';
import 'package:milestone/app/controller/app_text_styles.dart';
import 'package:milestone/utils/utils.dart';

/// Keys used to specify the legal information document type.
class LegalKeys {
  const LegalKeys._();

  /// Key for Privacy Policy.
  static const String privacyPolicy = 'PRIVACY_POLICY';

  /// Key for Terms & Conditions.
  static const String termsAndConditions = 'TERMS_AND_CONDITIONS';
}

/// Enum representing the legal information types.
enum LegalInformationType {
  /// Privacy policy type.
  privacyPolicy(LegalKeys.privacyPolicy),

  /// Terms and conditions type.
  termsAndConditions(LegalKeys.termsAndConditions);

  const LegalInformationType(this.key);

  /// String key representing the legal type.
  final String key;

  /// Resolves the type from a given string key.
  static LegalInformationType fromKey(String? key) {
    if (key == LegalKeys.privacyPolicy) {
      return LegalInformationType.privacyPolicy;
    }
    return LegalInformationType.termsAndConditions;
  }
}

/// A unified page to display legal information such as
/// Terms & Conditions or Privacy Policy based on [legalKey].
class LegalInformationPage extends StatelessWidget {
  /// Default constructor taking a [legalKey] (`PRIVACY_POLICY` or `TERMS_AND_CONDITIONS`).
  const LegalInformationPage({
    required this.legalKey,
    this.title,
    this.content,
    this.paragraphs,
    super.key,
  });

  /// Factory constructor for the Terms & Conditions screen.
  const LegalInformationPage.termsAndConditions({
    this.title,
    this.content,
    this.paragraphs,
    super.key,
  }) : legalKey = LegalKeys.termsAndConditions;

  /// Factory constructor for the Privacy Policy screen.
  const LegalInformationPage.privacyPolicy({
    this.title,
    this.content,
    this.paragraphs,
    super.key,
  }) : legalKey = LegalKeys.privacyPolicy;

  /// The key identifying the legal document ('PRIVACY_POLICY' or 'TERMS_AND_CONDITIONS').
  final String legalKey;

  /// Optional custom title override. Defaults to localized document title.
  final String? title;

  /// Optional custom body widget override.
  final Widget? content;

  /// Optional custom list of text paragraphs.
  final List<String>? paragraphs;

  static const List<String> _defaultParagraphs = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis vel eros donec ac odio. Imperdiet sed euismod nisi porta.',
    'Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae. Pellentesque nec nam aliquam sem et tortor. Etiam tempor orci eu lobortis elementum nibh tellus. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Suspendisse in est ante in nibh mauris cursus. Ut etiam sit amet nisl.',
    'Velit aliquet sagittis id consectetur purus ut faucibus. Lacinia quis vel eros donec ac odio tempor. Quam nulla porttitor massa id neque aliquam vestibulum. Sit amet nisl suscipit adipiscing bibendum est. Pellentesque habitant morbi tristique senectus et netus et. Quis eleifend quam adipiscing vitae. Ridiculus mus mauris vitae ultricies leo integer. Scelerisque felis imperdiet proin fermentum leo.',
  ];

  String _resolveTitle(BuildContext context) {
    if (title != null) return title!;
    final type = LegalInformationType.fromKey(legalKey);
    switch (type) {
      case LegalInformationType.privacyPolicy:
        return context.l10n.privacyPolicy;
      case LegalInformationType.termsAndConditions:
        return context.l10n.termsAndConditions;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final displayParagraphs = paragraphs ?? _defaultParagraphs;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: CommonAppBar(
        title: _resolveTitle(context),
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.tertiary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: content ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < displayParagraphs.length; i++) ...[
                          Text(
                            displayParagraphs[i],
                            style: context.bodyLarge(
                              color: colors.onSurface,
                              height: 1.5,
                            ),
                          ),
                          if (i < displayParagraphs.length - 1)
                            const SizedBox(height: 20),
                        ],
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
