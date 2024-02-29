import 'dart:async';
import 'dart:developer';

import 'package:ai_gemini_chat_app/product/app/app_initialize.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  //For flutter errors (widget errors etc.)
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(() => _onInit(builder), _onError);
}

///initial func
Future<void> _onInit(
  FutureOr<Widget> Function() builder,
) async {
  runApp(await builder());
  await AppInit().start();
}

///Handles zone error
void _onError(Object error, StackTrace stack) {
  log(error.toString(), stackTrace: stack);
}
