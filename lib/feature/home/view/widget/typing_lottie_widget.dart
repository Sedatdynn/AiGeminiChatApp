import 'package:ai_gemini_chat_app/feature/home/bloc/ai_chat_bloc.dart';
import 'package:ai_gemini_chat_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypingLottieWidget extends StatelessWidget {
  const TypingLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiChatBloc, AiChatState>(
      builder: (context, state) {
        return state.isTyping! ? Assets.lottie.typing.lottie(height: 70) : const SizedBox.shrink();
      },
    );
  }
}
