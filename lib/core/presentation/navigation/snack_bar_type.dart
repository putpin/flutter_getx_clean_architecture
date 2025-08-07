import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  failure;

  Color get backgroundColor {
    switch (this) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.failure:
        return Colors.red;
    }
  }
}
