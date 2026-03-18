import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackBar({
    required String message,
    required ContentType type,
    required BuildContext context,
    IconData? icon,
    String? title,
    Color? color,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,

      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: title ?? _getTitle(type),
        message: message,
        contentType: type,
        color: color,
        titleTextStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
        messageTextStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String _getTitle(ContentType type) {
    switch (type) {
      case ContentType.success:
        return "Success!";
      case ContentType.failure:
        return "Error!";
      case ContentType.warning:
        return "Warning!";
      case ContentType.help:
        return "Note!";
    }
    return "";
  }
}
