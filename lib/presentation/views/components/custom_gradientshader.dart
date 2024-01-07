import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask(
      {Key? key, this.child, this.gradientOne, this.gradientTwo})
      : super(key: key);
  final Widget? child;
  final Color? gradientOne;
  final Color? gradientTwo;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [gradientOne ?? Colors.white, gradientTwo ?? Colors.white],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
