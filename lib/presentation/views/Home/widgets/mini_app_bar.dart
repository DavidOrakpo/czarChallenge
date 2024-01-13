import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Streaks/Pages/streaks.dart';

class MiniAppBar extends StatelessWidget {
  const MiniAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.textGray,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  "assets/icons/flag.jpg",
                  height: 30,
                  width: 35,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down_sharp,
                color: AppColors.textGray,
                size: 30,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(StreaksPage.routeIdentifier);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/fire_icon.png",
                  scale: 2,
                ),
                2.0.horizontalSpace(),
                Text(
                  "2",
                  style: AppTextStyle.bodyThree.copyWith(
                    color: AppColors.action,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/target.png",
                scale: 2,
              ),
              2.0.horizontalSpace(),
              Text(
                "17",
                style: AppTextStyle.bodyThree.copyWith(
                  color: AppColors.action,
                ),
              )
            ],
          ),
          Image.asset(
            "assets/icons/notification.png",
            scale: 3,
          ),
        ],
      ),
    );
  }
}
