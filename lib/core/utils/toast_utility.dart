import 'package:flutter/material.dart';

enum ToastStates {
  success,
  error,
  warning,
}

class ToastUtility {
  static Color chooseToastColor(ToastStates state) {
    Color color;
    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.yellow;
        break;
    }
    return color;
  }
}
