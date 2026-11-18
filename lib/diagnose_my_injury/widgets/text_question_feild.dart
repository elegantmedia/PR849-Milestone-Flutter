import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milestone/diagnose_my_injury/widgets/question_feild.dart';
import 'package:milestone/utils/utils.dart';

class TextQuestionField extends StatelessWidget {
  const TextQuestionField({
    required this.title,
    required this.controller,
    this.description,
    this.hintText,
    this.maxLength,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final String? description;
  final String? hintText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return QuestionField(
      title: title,
      description: description,
      child: CommonTextField(
        controller: controller,
        hintText: hintText ?? context.l10n.diagnoseTypeHere,
        minLines: 4,
        maxLines: 4,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        alignLabelWithHint: true,
        inputFormatters: [
          if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
