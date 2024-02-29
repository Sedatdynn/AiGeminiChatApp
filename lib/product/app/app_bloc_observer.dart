import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  /// know the change in same bloc
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange => (${bloc.runtimeType}, $change)');
  }

  /// know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log("onError => (Error happened in $bloc with error $error and the stacktrace is $stackTrace)");
  }

  /// when and what changed in our Bloc
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    log("onTransition => (There was a transition from ${transition.currentState} to ${transition.nextState})");
  }

  /// know when created
  @override
  void onCreate(BlocBase bloc) {
    log("onCreate => (${bloc.runtimeType} created)");
    super.onCreate(bloc);
  }

  /// know when closed
  @override
  void onClose(BlocBase bloc) {
    log("onClose => (${bloc.runtimeType} closed)");
    super.onClose(bloc);
  }
}
