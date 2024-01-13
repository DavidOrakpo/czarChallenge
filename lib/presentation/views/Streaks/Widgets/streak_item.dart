import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class StreakItem extends StatelessWidget {
  final String title;
  final bool onStreak;
  const StreakItem({super.key, required this.title, required this.onStreak});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyle.bodyThree.copyWith(
            color: onStreak ? AppColors.action : AppColors.textGray,
            fontSize: 20,
          ),
        ),
        SvgPicture.asset(
          "assets/icons/app_icon.svg",
          height: 20,
          width: 20,
          alignment: Alignment.bottomLeft,
          color: onStreak ? AppColors.action : AppColors.textGray,
        ),
      ],
    );
  }
}
