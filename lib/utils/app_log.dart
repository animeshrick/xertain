import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class AppLog {
  log(String message) {
    if (kDebugMode) {
      dev.log(" ✔️log -> $message ✔️");
    }
  }

  errLog({required String err, StackTrace? stackTrace}) {
    if (kDebugMode) {
      dev.log(
        'Error',
        error: err,
        stackTrace: stackTrace,
      );
    }
  }
}
