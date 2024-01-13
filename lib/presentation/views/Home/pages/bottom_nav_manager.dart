import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // color: Colors.red,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColors.gray.shade400,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ],
          border: Border(
            top: BorderSide(
              color: AppColors.gray.shade400,
              width: 1.0,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: AppColors.background,
            )),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: navigationShell.currentIndex == 0
                                ? AppColors.action
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: navigationShell.currentIndex == 1
                                ? AppColors.action
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: navigationShell.currentIndex == 2
                                ? AppColors.action
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: navigationShell.currentIndex == 3
                                ? AppColors.action
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: constraints.maxWidth * 0.5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: navigationShell.currentIndex == 4
                                ? AppColors.action
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              // indicatorShape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              // indicatorColor: Colors.red,
              backgroundColor: Colors.transparent,
              // height: 70,
              destinations: [
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Icon(
                //       Icons.home,
                //       color: navigationShell.currentIndex == 0
                //           ? AppColors.action
                //           : AppColors.gray,
                //     ),
                //     5.0.verticalSpace(),
                //     const Text("Home")
                //   ],
                // ),
                NavigationDestination(
                  label: 'Home',
                  // icon: Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Container(
                  //       height: 2,
                  //       width: 50,
                  //       decoration: BoxDecoration(
                  //         color: AppColors.action,
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //     Icon(
                  //       Icons.home,
                  //       color: navigationShell.currentIndex == 0
                  //           ? AppColors.action
                  //           : AppColors.gray,
                  //     ),
                  //   ],
                  // ),
                  icon: SvgPicture.asset(
                    "assets/icons/home_icon.svg",
                    color: navigationShell.currentIndex == 0
                        ? AppColors.action
                        : AppColors.gray,
                  ),
                ),
                NavigationDestination(
                  label: 'Lesson',
                  icon: SvgPicture.asset(
                    "assets/icons/lesson_icon.svg",
                    color: navigationShell.currentIndex == 1
                        ? AppColors.action
                        : AppColors.gray,
                  ),
                ),
                NavigationDestination(
                  label: 'Exercise',
                  icon: SvgPicture.asset(
                    "assets/icons/exercise_icon.svg",
                    color: navigationShell.currentIndex == 2
                        ? AppColors.action
                        : AppColors.gray,
                  ),
                ),
                NavigationDestination(
                  label: 'Games',
                  icon: SvgPicture.asset(
                    "assets/icons/games_icon.svg",
                    color: navigationShell.currentIndex == 3
                        ? AppColors.action
                        : AppColors.gray,
                  ),
                ),
                NavigationDestination(
                  label: 'Chat',
                  icon: SvgPicture.asset(
                    "assets/icons/chat_icon.svg",
                    color: navigationShell.currentIndex == 4
                        ? AppColors.action
                        : AppColors.gray,
                  ),
                ),
              ],
              onDestinationSelected: _goBranch,
            ),
          ],
        ),
      ),
    );
  }
}
