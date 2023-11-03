import 'package:flutter/material.dart';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PikdyToasts {
  void customErrorToast(String message, BuildContext context) {
    showToast(
      message,
      textStyle: const TextStyle(
        fontSize: 14,
        fontFamily: "secondary",
        color: Colors.white,
      ),
      textPadding: const EdgeInsets.symmetric(vertical: 18.0),
      position: StyledToastPosition.bottom,
      toastHorizontalMargin: 25,
      backgroundColor: Colors.red,
      fullWidth: true,
      borderRadius: BorderRadius.circular(6),
      animation: StyledToastAnimation.fade,
      duration: const Duration(seconds: 5),
      context: context,
    );
  }
}