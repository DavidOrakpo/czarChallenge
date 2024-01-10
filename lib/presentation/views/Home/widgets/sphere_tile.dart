import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class SphereTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final double completionPercent;

  const SphereTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.completionPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.action,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
          10.0.verticalSpace(),
          Text(
            title,
            style: AppTextStyle.headerFour.copyWith(
              color: AppColors.black,
            ),
          ),
          5.0.verticalSpace(),
          Text(
            "You completed ${completionPercent * 100}%",
            style: AppTextStyle.bodyThree.copyWith(
              color: AppColors.textGray,
            ),
          ),
          5.0.verticalSpace(),
          SizedBox(
            height: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: completionPercent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
