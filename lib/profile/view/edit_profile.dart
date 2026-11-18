import 'package:flutter/material.dart';
import 'package:milestone/utils/utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    this.firstName = '',
    this.lastName = '',
    super.key,
  });

  final String firstName;
  final String lastName;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop((
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
    ),);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: context.l10n.editProfile,
        showBackButton: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ExtendedColumn(
            children: [
              Gaps.gapMd16,
              CommonTextField(
                controller: _firstNameController,
                title: context.l10n.firstName,
                hintText: context.l10n.firstNameRequired,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.givenName],
                validator: (value) => value == null || value.trim().isEmpty ? context.l10n.firstNameRequired : null,
              ),
              Gaps.gapMd16,
              CommonTextField(
                controller: _lastNameController,
                title: context.l10n.lastName,
                hintText: context.l10n.lastNameRequired,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.familyName],
                validator: (value) => value == null || value.trim().isEmpty ? context.l10n.lastNameRequired : null,
                onFieldSubmitted: (_) => _saveChanges(),
              ),
              Gaps.gapLg24,
              const Spacer(),
              CommonButton.primary(
                label: 'Save Changes',
                onPressed: _saveChanges,
              ),
              Gaps.gapLg24,
            ],
          ),
        ),
      ),
    );
  }
}
