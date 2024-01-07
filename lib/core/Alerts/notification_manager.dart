import 'package:flutter/material.dart';

import 'package:template/core/Alerts/context.dart';

/// Handles all notifications sent to the user to convey different states in the app.
class NotificationManager {
  /// Informs the user of a successful action taken, displaying [message] for explaination
  static void notifySuccess(String message) {
    _showSnackBar(Colors.green, AppNavigator().navKey.currentContext!, message);
  }

  /// Informs the user that an error occured, displaying [message] for explaination
  static void notifyError(String message) {
    _showSnackBar(Colors.red, AppNavigator().navKey.currentContext!, message);
  }

  /// Informs the user of state changes in the app, displaying [message] for explaination
  static void notifyInfo(String message) {
    _showSnackBar(
        Colors.blue.shade900, AppNavigator().navKey.currentContext!, message);
  }

  /// Shows a snack bar to the user, taking a [color], [context] and [message]
  static void _showSnackBar(Color color, BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(message),
          dismissDirection: DismissDirection.down,
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
