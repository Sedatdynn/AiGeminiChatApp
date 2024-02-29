import 'package:ai_gemini_chat_app/feature/home/bloc/ai_chat_bloc.dart';
import 'package:ai_gemini_chat_app/product/constant/text_constants.dart';
import 'package:ai_gemini_chat_app/product/extension/context_extension.dart';
import 'package:ai_gemini_chat_app/product/padding/app_padding.dart';
import 'package:ai_gemini_chat_app/product/widget/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeSendMessageWidget extends StatelessWidget {
  const TypeSendMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatBloc, AiChatState>(
      builder: (context, state) {
        return Container(
          padding: const AppPadding.normalAll(),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                    hintText: AppString.askQuestion,
                    focusNode: context.read<AiChatBloc>().getFocusNode,
                    textController: context.read<AiChatBloc>().getTextController),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => context.read<AiChatBloc>().sendMessage(),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: context.colorScheme.primary,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: context.colorScheme.onSecondary,
                    child: Icon(
                      Icons.send_outlined,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
