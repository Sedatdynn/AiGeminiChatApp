import 'package:ai_gemini_chat_app/product/typedef/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ai_chat_response_model.freezed.dart';
part 'ai_chat_response_model.g.dart';

@freezed
class AiChatResponseModel with _$AiChatResponseModel {
  const factory AiChatResponseModel({
    required List<Candidates>? candidates,
  }) = _AiChatResponseModel;
  factory AiChatResponseModel.fromJson(MapDataObject json) => _$AiChatResponseModelFromJson(json);
}

@freezed
class Candidates with _$Candidates {
  const factory Candidates({
    required Content? content,
  }) = _Candidates;
  factory Candidates.fromJson(MapDataObject json) => _$CandidatesFromJson(json);
}

@freezed
class Content with _$Content {
  const factory Content({
    required List<Parts>? parts,
    required String? role,
  }) = _Content;
  factory Content.fromJson(MapDataObject json) => _$ContentFromJson(json);
}

@freezed
class Parts with _$Parts {
  const factory Parts({
    required String text,
  }) = _Parts;
  factory Parts.fromJson(MapDataObject json) => _$PartsFromJson(json);
}
