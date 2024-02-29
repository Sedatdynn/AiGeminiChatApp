import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

final class CustomSnackBar {
  static void showSnackBar(
      {required BuildContext context, required String message, Color? backgroundColor}) {
    var snackbar = SnackBar(
      content: Text(message,
          style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.surface)),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: backgroundColor ?? context.colorScheme.onError,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
