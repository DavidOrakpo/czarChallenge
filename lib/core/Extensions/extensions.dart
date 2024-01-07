/// Extension on [String] that capitalizes the first letter of the first word in a sentence
import 'package:flutter/material.dart';

extension FigmaDimension on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class MyScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class NoScalingAnimation extends FloatingActionButtonAnimator {
  double? _x;
  double? _y;
  @override
  Offset getOffset({Offset? begin, Offset? end, double? progress}) {
    return end!;
  }

  @override
  Animation<double> getRotationAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent!);
  }

  @override
  Animation<double> getScaleAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent!);
  }
}

extension addPadding on Widget {
  Widget padding({required EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}

extension DoubleToHeight on double {
  SizedBox verticalSpace() {
    return SizedBox(
      height: this,
    );
  }

  SizedBox horizontalSpace() {
    return SizedBox(
      width: this,
    );
  }
}

extension ListExtension<E> on List<E> {
  void addAllUnique(Iterable<E> iterable) {
    for (var element in iterable) {
      if (!contains(element)) {
        add(element);
      }
    }
  }
}
