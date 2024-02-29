import 'dart:developer';
import 'dart:io';

import 'package:ai_gemini_chat_app/core/exception/exception.dart';
import 'package:ai_gemini_chat_app/feature/home/models/ai_chat_message_model.dart';
import 'package:ai_gemini_chat_app/feature/home/models/ai_chat_response_model.dart';
import 'package:ai_gemini_chat_app/product/constant/network_constants.dart';
import 'package:ai_gemini_chat_app/product/constant/text_constants.dart';
import 'package:ai_gemini_chat_app/product/typedef/typedef.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

sealed class IHomeService {
  BaseResponseData<String> sendMessage(List<ChatMessageModel> previousMessages);
}

class HomeService extends IHomeService {
  HomeService() : super();
  Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json'}));
  @override
  BaseResponseData<String> sendMessage(List<ChatMessageModel> previousMessages) async {
    try {
      final response = await dio.post('${NetworkConstants.baseUrl}${NetworkConstants.apiKey}',
          data: {"contents": previousMessages.map((e) => e.toJson()).toList()});
      if (response.statusCode == HttpStatus.ok) {
        final String message = AiChatResponseModel.fromJson(response.data)
            .candidates!
            .first
            .content!
            .parts!
            .first
            .text;
        return Right(message);
      }
    } catch (e) {
      log(e.toString());
      return Left(ServerException(message: e.toString(), statusCode: '505'));
    }
    return const Left(ServerException(message: AppString.unhandled, statusCode: '505'));
  }
}
