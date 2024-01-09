import 'package:flutter/material.dart';

/// Provides a global Key for the Navigator State.
///
/// This gives access to the current Build Context of the App,
/// allowing the [NotificationManager] class to show snack bar notifications
/// to the end user
class AppNavigator {
  AppNavigator._internal();
  static final AppNavigator _instance = AppNavigator._internal();
  factory AppNavigator() {
    return _instance;
  }

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  final _homeTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get homeTabNavKey => _homeTabNavKey;

  final _lessonTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get lessonTabNavKey => _lessonTabNavKey;

  final _exerciseTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get excersizeTabNavKey => _exerciseTabNavKey;

  final _gamesTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get gamesTabNavKey => _gamesTabNavKey;

  final _chatTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get chatTabNavKey => _chatTabNavKey;

  /// The global key for the Navigator State
  GlobalKey<NavigatorState> get navKey => _navKey;
}
