import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.focusNode,
    required this.textController,
    super.key,
  });
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: textController,
      style: context.textTheme.bodyLarge,
      decoration: _textfieldDecoration(context),
    );
  }

  InputDecoration _textfieldDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      hintText: hintText,
      hintStyle: context.textTheme.bodyMedium,
      fillColor: context.colorScheme.onSecondary,
      filled: true,
      enabledBorder: _customBorder(context),
      focusedBorder: _customBorder(context),
    );
  }

  OutlineInputBorder _customBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
    );
  }
}
