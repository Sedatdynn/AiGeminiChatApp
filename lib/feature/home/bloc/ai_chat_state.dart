part of 'ai_chat_bloc.dart';

class AiChatState extends Equatable {
  const AiChatState(
      {required this.isLoading,
      required this.errorMessage,
      required this.isTyping,
      required this.messages});
  final bool isLoading;
  final String? errorMessage;
  final bool? isTyping;
  final List<ChatMessageModel> messages;

  AiChatState.initial() : this(isLoading: false, errorMessage: null, isTyping: false, messages: []);

  @override
  List<Object?> get props => [isLoading, errorMessage, isTyping, messages];

  AiChatState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isTyping,
    List<ChatMessageModel>? messages,
  }) {
    return AiChatState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
