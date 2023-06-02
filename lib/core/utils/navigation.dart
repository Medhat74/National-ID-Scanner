import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateTo({
    required BuildContext context,
    required Widget destinationScreen,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationScreen),
      );

  static void navigateToWithCallback({
    required BuildContext context,
    required Widget destinationScreen,
    required VoidCallback callback,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destinationScreen,
      ),
    ).then(
          (value) => callback(),
    );
  }

  static void navigateAndClearStack({
    required BuildContext context,
    required Widget destinationScreen,
  }) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => destinationScreen,
        ),
            (Route<dynamic> route) => false,
      );

  static void navigateBack({
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}