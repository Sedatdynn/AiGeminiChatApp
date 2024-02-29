import 'package:ai_gemini_chat_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

const ColorScheme _colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(221, 42, 35, 175),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF9E9E9E),
  onSecondary: Color(0xFFFFECB3),
  tertiary: Color.fromARGB(255, 22, 107, 54),
  onTertiary: Color(0xFF000000),
  error: Color(0xFFF44336),
  onError: Color(0xFFF44336),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
);
TextTheme _lightTextTheme = TextTheme(
  headlineMedium: TextStyle(color: _colorScheme.surface, fontWeight: FontWeight.bold),
  titleLarge:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: _colorScheme.onBackground),
  bodyLarge: TextStyle(fontSize: 18, color: _colorScheme.onBackground),
  bodyMedium: TextStyle(
    fontSize: 16,
    color: _colorScheme.secondary,
    fontWeight: FontWeight.w100,
  ),
);

IconThemeData _iconTheme = IconThemeData(
  color: _colorScheme.tertiary,
  opacity: 1,
  size: 24,
);
final ThemeData customTheme = ThemeData(
  fontFamily: FontFamily.pacifico,
  useMaterial3: false,
  brightness: Brightness.dark,
  colorScheme: _colorScheme,
  textTheme: _lightTextTheme,
  iconTheme: _iconTheme,
);
