import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:template/presentation/styles/app_colors.dart';

class BlurredContainer extends StatelessWidget {
  BlurredContainer({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.sigmaX,
    this.sigmaY,
    this.padding,
    this.child,
  }) : super(key: key);
  double? height, width, sigmaX, sigmaY;
  Color? backgroundColor;
  EdgeInsets? padding;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX ?? 5.0, sigmaY: sigmaY ?? 5.0),
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 63, 61, 61).withOpacity(0.75)
              : AppColors.gray.shade500.withOpacity(0.8),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
