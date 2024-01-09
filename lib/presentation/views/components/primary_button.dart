import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';

import '../../styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  double? cornerRadius;
  double? width;
  final double height;
  final double? leftPadding;
  final double? topPadding;
  final Color? backgroundColor;
  final String text;
  final Color textColor;
  final Color iconColor;
  final Color? borderColor, shadowColor;
  final double fontSize;
  final List<Color>? gradientColorList;
  final List<double>? gradientStops;
  final bool hasIcon;
  final bool filled;
  final bool hasShadow;
  final Alignment? begin, end;
  final double borderWidth;
  final bool hasGradient;
  final IconData? icon;
  final FontWeight fontweight;
  final bool isLoading;
  bool? isValidated;
  Duration? animatedDuration;
  final void Function()? onPressed;
  PrimaryButton(
      {Key? key,
      this.cornerRadius,
      this.gradientColorList,
      this.shadowColor,
      this.isValidated = true,
      this.isLoading = false,
      this.leftPadding,
      this.animatedDuration,
      this.topPadding,
      this.gradientStops,
      this.hasIcon = false,
      this.begin,
      this.end,
      this.width,
      this.height = 55,
      this.icon,
      this.hasShadow = false,
      this.borderColor,
      this.hasGradient = false,
      this.filled = true,
      this.iconColor = Colors.transparent,
      this.backgroundColor = AppColors.action,
      this.borderWidth = 1,
      this.text = "",
      this.textColor = AppColors.white,
      this.fontSize = 16,
      this.fontweight = FontWeight.normal,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animatedDuration ?? const Duration(milliseconds: 250),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.action,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius ?? 60),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: leftPadding ?? 45, vertical: topPadding ?? 17),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.white,
                    // valueColor: AlwaysStoppedAnimation(AppColors.white),
                  ),
                ),
              )
            : hasIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: AppTextStyle.buttonText.copyWith(
                          color: textColor,
                          fontSize: fontSize,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        icon!,
                        color: iconColor,
                        size: 18,
                      ),
                    ],
                  )
                : Consumer(
                    builder: (context, ref, child) {
                      final themeProv = ref.watch(themeProvider);
                      return Text(
                        text,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.buttonText.copyWith(
                          color: themeProv.darkTheme
                              ? isValidated!
                                  ? textColor
                                  : AppColors.textGray.withOpacity(0.3)
                              : textColor,
                          fontSize: fontSize,
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
