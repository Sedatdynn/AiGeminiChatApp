import 'package:ai_gemini_chat_app/bootstrap.dart';
import 'package:ai_gemini_chat_app/core/theme/theme.dart';
import 'package:ai_gemini_chat_app/feature/home/view/home_view.dart';
import 'package:ai_gemini_chat_app/product/constant/text_constants.dart';
import 'package:flutter/material.dart';

void main() {
  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: const HomeView(),
    );
  }
}
