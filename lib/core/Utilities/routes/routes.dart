import 'package:go_router/go_router.dart';

import 'package:template/core/Alerts/context.dart';
import 'package:template/presentation/views/Home/home_page.dart';


final goRouterProvider = Provider<GoRouter>((ref) {
  return AppRoutes(ref: ref).router;
});

/// Manages the routing of pages within the app using [GoRouter]
class AppRoutes {
  AppRoutes._internal();
  static final AppRoutes _instance = AppRoutes._internal();
  factory AppRoutes() {
    return _instance;
  }

  /// The routing object that contains the list of routes for navigation.
  ///
  /// It is assigned a navigator Key [AppNavigator().navKey] to retrieve the current Build Context.
  final GoRouter router = GoRouter(
    navigatorKey: AppNavigator().navKey,
    routes: [
      GoRoute(
        path: "/",
        name: HomePage.routeIdentifier,
        builder: (context, state) => const HomePage(),
      )
    ],
  );
}
