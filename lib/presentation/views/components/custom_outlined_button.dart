import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_button.dart';

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
    this.fontweight,
    this.isAvenir,
    this.borderRadius = 12,
    this.width,
    this.text,
    this.textColor,
  }) : super(key: key);
  void Function()? onPressed;
  bool? isAvenir;
  Color? borderColor, textColor, backgroundColor;
  double? borderWidth, fontSize, width, borderRadius;
  String? text;
  FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width ?? double.infinity,
      filled: false,
      backgroundColor: backgroundColor ?? Colors.transparent,
      cornerRadius: borderRadius!,
      onPressed: onPressed ?? () {},
      borderColor: borderColor ?? Constants.primaryGray2,
      borderWidth: borderWidth ?? 2,
      text: text ?? "No, I decline",
      textColor: textColor ?? Constants.primaryGray2,
      fontSize: fontSize ?? 16,
      fontweight: fontweight ?? FontWeight.bold,
      isAvenir: isAvenir ?? true,
    );
  }
}
