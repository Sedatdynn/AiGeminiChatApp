part of 'ai_chat_bloc.dart';

@immutable
sealed class AiChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AiChatSendMessageEvent extends AiChatEvent {
  AiChatSendMessageEvent({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
