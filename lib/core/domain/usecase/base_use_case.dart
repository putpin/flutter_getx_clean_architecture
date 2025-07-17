import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

abstract class UseCase<Input, Output> {
  const UseCase();

  FutureOr<Output> execute(
    Input input,
  );

  @mustCallSuper
  void dispose() {
    log('dispose -- $runtimeType');
  }
}

abstract class NoInputUseCase<Output> {
  const NoInputUseCase();

  FutureOr<Output> execute();

  @mustCallSuper
  void dispose() {
    log('dispose -- $runtimeType');
  }
}
