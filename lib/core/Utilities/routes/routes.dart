import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:template/core/Alerts/context.dart';
import 'package:template/core/Utilities/Transitions/transitions.dart';
import 'package:template/presentation/views/Chats/Pages/chats.dart';
import 'package:template/presentation/views/Exercises/Pages/execerise.dart';
import 'package:template/presentation/views/Games/Pages/games.dart';
import 'package:template/presentation/views/Home/pages/bottom_nav_manager.dart';
import 'package:template/presentation/views/Home/pages/home_page.dart';
import 'package:template/presentation/views/Lesson/Pages/lessons.dart';
import 'package:template/presentation/views/onboarding/pages/interests.dart';
import 'package:template/presentation/views/splashscreen/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return AppRoutes(ref: ref).router;
});

/// Manages the routing of pages within the app using [GoRouter]
class AppRoutes {
  AppRoutes._internal();
  late GoRouter router;
  late Ref _ref;
  static final AppRoutes _instance = AppRoutes._internal();
  factory AppRoutes({required Ref ref}) {
    _instance._ref = ref;
    _instance.router = GoRouter(
      navigatorKey: AppNavigator().navKey,
      routes: [
        GoRoute(
          path: "/",
          name: SplashScreenPage.routeIdentifier,
          builder: (context, state) => const SplashScreenPage(),
        ),
        GoRoute(
          path: "/interest",
          name: InterestPage.routeIdentifier,
          builder: (context, state) => const InterestPage(),
          pageBuilder: (context, state) {
            return CustomVerticalSlideTransition(
              key: state.pageKey,
              child: const InterestPage(),
            );
          },
        ),
        StatefulShellRoute.indexedStack(
          pageBuilder: (context, state, navigationShell) {
            return CustomFadeTransition(
              key: state.pageKey,
              child: ScaffoldWithNestedNavigation(
                navigationShell: navigationShell,
              ),
            );
          },
          branches: [
            //TODO: Create the sub pages
            StatefulShellBranch(
              navigatorKey: AppNavigator().homeTabNavKey,
              routes: [
                GoRoute(
                  path: "/home",
                  name: HomePage.routeIdentifier,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomePage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: AppNavigator().lessonTabNavKey,
              routes: [
                GoRoute(
                  path: "/lessons",
                  name: LessonsPage.routeIdentifier,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: LessonsPage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: AppNavigator().excersizeTabNavKey,
              routes: [
                GoRoute(
                  path: "/exercise",
                  name: ExercisePage.routeIdentifier,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ExercisePage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: AppNavigator().gamesTabNavKey,
              routes: [
                GoRoute(
                  path: "/games",
                  name: GamesPage.routeIdentifier,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: GamesPage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: AppNavigator().chatTabNavKey,
              routes: [
                GoRoute(
                  path: "/chat",
                  name: ChatsPage.routeIdentifier,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ChatsPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    return _instance;
  }

  /// The routing object that contains the list of routes for navigation.
  ///
  /// It is assigned a navigator Key [AppNavigator().navKey] to retrieve the current Build Context.
  // final GoRouter router = GoRouter(
  //   navigatorKey: AppNavigator().navKey,
  //   routes: [
  //     GoRoute(
  //       path: "/",
  //       name: HomePage.routeIdentifier,
  //       builder: (context, state) => const HomePage(),
  //     )
  //   ],
  // );
}
