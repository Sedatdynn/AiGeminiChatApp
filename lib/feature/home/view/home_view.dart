import 'package:ai_gemini_chat_app/feature/home/bloc/ai_chat_bloc.dart';
import 'package:ai_gemini_chat_app/feature/home/view/widget/index.dart';
import 'package:ai_gemini_chat_app/product/widget/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiChatBloc(),
      child: const SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: _CustomScrollList()),
              TypingLottieWidget(),
              TypeSendMessageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomScrollList extends StatelessWidget {
  const _CustomScrollList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiChatBloc, AiChatState>(
      listenWhen: (previous, current) => current.errorMessage != null,
      listener: (context, state) =>
          CustomSnackBar.showSnackBar(context: context, message: state.errorMessage!),
      builder: (context, state) {
        return CustomScrollView(
          controller: context.read<AiChatBloc>().getScrollController,
          slivers: <Widget>[
            const CustomSliverAppBar(),
            MessageBodyList(
              state: state,
            )
          ],
        );
      },
    );
  }
}
