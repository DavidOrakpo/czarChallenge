import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A custom implementation of the [CustomTransitionpage] which enables a Slide
/// Transition from one page route to another.
class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 750),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}

class CustomVerticalSlideTransition extends CustomTransitionPage<void> {
  final Duration? duration;
  CustomVerticalSlideTransition(
      {super.key,
      required super.child,
      this.duration = const Duration(milliseconds: 750)})
      : super(
          transitionDuration: duration!,
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1.5),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            );
          },
        );
}

class CustomFadeTransition extends CustomTransitionPage<void> {
  CustomFadeTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 750),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
}

class CustomScaleTransition extends CustomTransitionPage<void> {
  CustomScaleTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (_, animation, __, child) {
            return ScaleTransition(
              scale: animation,
              // opacity:
              //     CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
}
