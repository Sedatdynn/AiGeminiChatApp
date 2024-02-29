import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
final class NetworkConstants {
  const NetworkConstants._();
  static const baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=';
  static String apiKey = dotenv.env["API_KEY"]!;
}
