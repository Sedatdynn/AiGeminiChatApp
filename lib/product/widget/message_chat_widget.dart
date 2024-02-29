import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({required this.message, required this.isUser, super.key});
  final bool isUser;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          isUser ? Icons.account_circle_outlined : Icons.rocket_launch_outlined,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: isUser
                ? context.textTheme.bodyLarge
                : context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
