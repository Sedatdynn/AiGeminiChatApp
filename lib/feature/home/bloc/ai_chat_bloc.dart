import 'dart:async';

import 'package:ai_gemini_chat_app/feature/home/models/ai_chat_message_model.dart';
import 'package:ai_gemini_chat_app/feature/home/service/home_service.dart';
import 'package:ai_gemini_chat_app/product/enum/chat_role.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'ai_chat_event.dart';
part 'ai_chat_state.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  AiChatBloc() : super(AiChatState.initial()) {
    init();
    on<AiChatSendMessageEvent>(aiChatSendMessageHandler);
  }

  void init() {
    _scrollController = ScrollController();
    _textController = TextEditingController();
    _focusNode = FocusNode();
  }

  final List<ChatMessageModel> chatMessages = [];
  final IHomeService _service = HomeService();

  late ScrollController _scrollController;
  late TextEditingController _textController;
  late FocusNode _focusNode;

  ScrollController get getScrollController => _scrollController;
  TextEditingController get getTextController => _textController;
  FocusNode get getFocusNode => _focusNode;

  Future<void> aiChatSendMessageHandler(
      AiChatSendMessageEvent event, Emitter<AiChatState> emit) async {
    emit(state.copyWith(isTyping: true));
    chatMessages.add(
        ChatMessageModel(role: ChatRole.user.name, parts: [ChatPartsModel(text: event.message)]));
    emit(state.copyWith(messages: chatMessages));
    final response = await _service.sendMessage(chatMessages);
    response.fold((error) => emit(state.copyWith(errorMessage: error.message, isTyping: false)),
        (answerText) {
      String aiAnswerText = answerText;
      if (aiAnswerText.isNotEmpty) {
        chatMessages.add(ChatMessageModel(
            role: ChatRole.model.name, parts: [ChatPartsModel(text: aiAnswerText)]));
        emit(state.copyWith(messages: chatMessages, isTyping: false));
        scrollListToEnd();
      }
    });
  }

  void scrollListToEnd() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 4), curve: Curves.easeOut);
    });
  }

  void sendMessage() {
    if (_textController.text.isEmpty || state.isTyping!) return;
    String text = _textController.text;
    _textController.clear();
    _focusNode.unfocus();
    add(AiChatSendMessageEvent(message: text));
  }
}
