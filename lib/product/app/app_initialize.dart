import 'package:ai_gemini_chat_app/gen/assets.gen.dart';
import 'package:ai_gemini_chat_app/product/app/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
final class AppInit {
  Future<void> start() async {
    Bloc.observer = const AppBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(
      fileName: Assets.env.env,
    );
  }
}
