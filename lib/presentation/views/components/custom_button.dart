import 'package:flutter/material.dart';
import 'package:template/presentation/styles/app_colors.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  final double cornerRadius;
  final double width;
  final double height;
  final Color? backgroundColor;
  final String text;
  final Color textColor;
  final Color iconColor;
  final Color? borderColor, shadowColor;
  final double fontSize;
  final List<Color>? gradientColorList;
  final List<double>? gradientStops;
  final bool isAvenir;
  final bool hasIcon;
  final bool filled;
  final bool hasShadow;
  final Alignment? begin, end;
  final double borderWidth;
  final bool hasGradient;
  final IconData? icon;
  final FontWeight fontweight;
  final bool isLoading;
  final void Function()? onPressed;
  const CustomButton(
      {Key? key,
      this.cornerRadius = 12,
      this.gradientColorList,
      this.shadowColor,
      this.isLoading = false,
      this.gradientStops,
      this.hasIcon = false,
      this.begin,
      this.end,
      this.width = double.infinity,
      this.height = 48,
      this.icon,
      this.hasShadow = false,
      this.borderColor,
      this.isAvenir = false,
      this.hasGradient = false,
      this.filled = true,
      this.iconColor = Colors.transparent,
      this.backgroundColor = Colors.transparent,
      this.borderWidth = 1,
      this.text = "",
      this.textColor = Constants.primaryGray3,
      this.fontSize = 12,
      this.fontweight = FontWeight.normal,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: filled
                  ? backgroundColor!
                  : borderColor ?? const Color(0xFF000000),
              width: borderWidth),
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                      color: shadowColor ?? Colors.black26,
                      offset: const Offset(5, 15),
                      blurRadius: 5.0)
                ]
              : [],
          gradient: LinearGradient(
            begin: hasGradient ? begin! : Alignment.topLeft,
            end: hasGradient ? end! : Alignment.bottomRight,
            stops: hasGradient ? gradientStops : [1],
            colors: hasGradient ? gradientColorList! : [backgroundColor!],
          ),
          // color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: hasGradient
                ? MaterialStateProperty.all(Colors.transparent)
                : MaterialStateProperty.all(backgroundColor),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.purple,
                      valueColor: AlwaysStoppedAnimation(Constants.prmaryWhite),
                    ),
                  ),
                )
              : hasIcon
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: isAvenir
                              ? TextStyle(
                                  color: textColor,
                                  // fontFamily: "Avenir",
                                  fontSize: fontSize,
                                  fontWeight: fontweight,
                                )
                              : TextStyle(
                                  color: textColor, fontSize: fontSize,
                                  fontWeight: fontweight,

                                  // fontFamily:
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          icon!,
                          color: iconColor,
                        ),
                      ],
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      style: isAvenir
                          ? TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                              fontWeight: fontweight,
                            )
                          : TextStyle(
                              color: textColor, fontSize: fontSize,
                              fontWeight: fontweight,

                              // fontFamily:
                            ),
                    ),
        ),
      ),
    );
  }
}
