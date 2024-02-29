import 'package:ai_gemini_chat_app/feature/home/bloc/ai_chat_bloc.dart';
import 'package:ai_gemini_chat_app/product/enum/chat_role.dart';
import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:ai_gemini_chat_app/product/padding/app_padding.dart';
import 'package:ai_gemini_chat_app/product/widget/index.dart';
import 'package:flutter/material.dart';

class MessageBodyList extends StatelessWidget {
  const MessageBodyList({required this.state, super.key});
  final AiChatState state;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        bool isUser = state.messages[index].role == ChatRole.user.name;
        return Container(
          margin: const AppPadding.minAll(),
          padding: const AppPadding.normalAll(),
          decoration: BoxDecoration(
              color: isUser ? context.colorScheme.surface : context.colorScheme.primary,
              borderRadius: BorderRadius.circular(12)),
          child: MessageWidget(
              message: state.messages[index].parts!.first.text.toString(), isUser: isUser),
        );
      },
      childCount: state.messages.length,
    ));
  }
}
