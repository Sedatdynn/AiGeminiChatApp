import 'package:ai_gemini_chat_app/product/typedef/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ai_chat_message_model.freezed.dart';
part 'ai_chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String role,
    required List<ChatPartsModel>? parts,
  }) = _ChatMessageModel;
  factory ChatMessageModel.fromJson(json) => _$ChatMessageModelFromJson(json);
}

@freezed
class ChatPartsModel with _$ChatPartsModel {
  const factory ChatPartsModel({
    required String text,
  }) = _ChatPartsModel;
  factory ChatPartsModel.fromJson(MapDataObject json) => _$ChatPartsModelFromJson(json);
}
