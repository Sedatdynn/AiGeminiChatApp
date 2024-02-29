import 'package:flutter/material.dart';

@immutable
final class AppPadding extends EdgeInsets {
  const AppPadding() : super.all(0);

  /// [AppPadding.minAll] is 8
  const AppPadding.minAll() : super.all(8);

  /// [ProjectPadding.normalAll] is 16

  const AppPadding.normalAll() : super.all(16);
}
