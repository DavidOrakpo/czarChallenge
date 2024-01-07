import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shimmer/shimmer.dart';
import 'package:template/core/Extensions/extensions.dart';

import '../../styles/app_colors.dart';
import '../../styles/darkMode_provider.dart';

class LoadingSkeleton extends ConsumerWidget {
  final double height;
  final double? width;
  final bool? isCircle;
  const LoadingSkeleton({
    super.key,
    required this.height,
    required this.width,
    required this.isCircle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(themeProvider);
    return Shimmer.fromColors(
      baseColor: provider.darkTheme ? AppColors.gray : AppColors.gray.shade400,
      highlightColor: provider.darkTheme
          ? AppColors.gray.shade300
          : AppColors.gray.shade500,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height < 30 ? 4 : 8),
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: isCircle! ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    ).padding(padding: const EdgeInsets.symmetric(horizontal: 20));
  }
}
