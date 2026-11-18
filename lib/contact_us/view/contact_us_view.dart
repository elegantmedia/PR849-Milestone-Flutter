import 'package:flutter/material.dart';
import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/utils/utils.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({
    this.onSubmit,
    this.onCallUs,
    this.onVisitWebsite,
    super.key,
  });

  final ValueChanged<String>? onSubmit;
  final VoidCallback? onCallUs;
  final VoidCallback? onVisitWebsite;

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _showUnavailable() {
    context.showSnackBar(context.l10n.contactActionsUnavailable);
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    final onSubmit = widget.onSubmit;
    if (onSubmit == null) {
      _showUnavailable();
      return;
    }
    onSubmit(_messageController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: CommonAppBar(
        title: l10n.contactUs,
        showBackButton: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.contactIntroduction,
                            textAlign: TextAlign.center,
                            style: context.bodyLarge(height: 1.5),
                          ),
                          const SizedBox(height: 40),
                          CommonTextField.description(
                            controller: _messageController,
                            title: l10n.contactMessage,
                            hintText: l10n.contactMessageHint,
                            minLines: 5,
                            maxLines: 5,
                            validator: (value) => value == null || value.trim().isEmpty ? l10n.contactMessageRequired : null,
                          ),
                          const SizedBox(height: 28),
                          CommonButton.primary(
                            label: l10n.submit,
                            onPressed: _submit,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CommonSocialField(
                          label: l10n.contactCallUs,
                          icon: Icons.call,
                          onTap: widget.onCallUs ?? _showUnavailable,
                        ),
                        const SizedBox(height: 12),
                        CommonSocialField(
                          label: l10n.contactVisitWebsite,
                          icon: Icons.open_in_new,
                          onTap: widget.onVisitWebsite ?? _showUnavailable,
                        ),
                      ],
                    ),
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
