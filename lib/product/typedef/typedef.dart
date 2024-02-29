import 'package:ai_gemini_chat_app/core/exception/exception.dart';
import 'package:fpdart/fpdart.dart';

typedef BaseResponseData<T> = Future<Either<ServerException, T>>;
typedef MapDataObject = Map<String, Object?>;
