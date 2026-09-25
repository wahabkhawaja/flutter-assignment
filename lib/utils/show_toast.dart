import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';

class ShowToast {
  static void success(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text("Success", style: getSemiBoldStyle(color: Colors.green.shade800)),
      description: Text(message, style: getRegularStyle(color: Colors.green.shade800)),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.green.shade50,
      primaryColor: Colors.green,
      foregroundColor: Colors.green.shade800,
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        color: Colors.green,
        linearTrackColor: Colors.green.shade100,
      ),
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static void error(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text("Error", style: getSemiBoldStyle(color: Colors.red.shade800)),
      description: Text(message, style: getRegularStyle(color: Colors.red.shade800)),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.red.shade50,
      primaryColor: Colors.red,
      foregroundColor: Colors.red.shade800,
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        color: Colors.red,
        linearTrackColor: Colors.red.shade100,
      ),
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static void warning(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      title: Text("Warning", style: getSemiBoldStyle(color: Colors.orange.shade800)),
      description: Text(message, style: getRegularStyle(color: Colors.orange.shade800)),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.orange.shade50,
      primaryColor: Colors.orange,
      foregroundColor: Colors.orange.shade800,
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        color: Colors.orange,
        linearTrackColor: Colors.orange.shade100,
      ),
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static void info(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text("Info", style: getSemiBoldStyle(color: Colors.blue.shade800)),
      description: Text(message, style: getRegularStyle(color: Colors.blue.shade800)),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.blue.shade50,
      primaryColor: Colors.blue,
      foregroundColor: Colors.blue.shade800,
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(
        color: Colors.blue,
        linearTrackColor: Colors.blue.shade100,
      ),
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}
