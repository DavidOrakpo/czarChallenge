import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';
import 'package:template/presentation/styles/text_styles.dart';

import '../../styles/app_colors.dart';

class SingleFieldInputWidget extends ConsumerWidget {
  final TextEditingController? controller;
  final Color? entryBackground;
  final String? labelText;
  final String? hintText;
  final double? fontSize;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  TextStyle? style;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final FontWeight? fontWeight;
  InputDecoration? decoration;
  List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffWidget;
  bool? hasSuffixIcon, obscureText;
  final String? Function(String?)? validator;
  SingleFieldInputWidget({
    super.key,
    required this.controller,
    this.entryBackground,
    this.hintText,
    this.onFieldSubmitted,
    this.obscureText,
    this.fontWeight,
    this.decoration,
    this.focusNode,
    this.maxLength,
    this.floatingLabelBehavior,
    this.textAlign,
    this.inputFormatters,
    this.fontSize,
    this.hasSuffixIcon = false,
    this.style,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.suffWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(themeProvider);
    return TextFormField(
      keyboardType: keyboardType,
      keyboardAppearance:
          darkTheme.darkTheme ? Brightness.dark : Brightness.light,
      maxLength: maxLength,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
          AppTextStyle.bodyOne.copyWith(
            fontSize: 16,
            fontWeight: fontWeight,
            height: 1.5,
          ),
      decoration: decoration ??
          InputDecoration(
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.errorColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            hintText: hintText,
            errorStyle: AppTextStyle.bodyTwo.copyWith(
              color: AppColors.errorColor,
            ),
            fillColor: entryBackground,
            floatingLabelBehavior: floatingLabelBehavior,
            label: Align(
              alignment: textAlign == TextAlign.center
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(
                labelText ?? "Enter Label Text...",
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyOne.copyWith(
                  fontSize: fontSize ?? 16,
                ),
              ),
            ),

            // labelText: labelText ?? "Enter Label Text...",
            suffixIcon: suffWidget,
            // labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //       fontSize: 16,
            //     ),
          ),
      controller: controller,
      validator: validator,
    );
  }
}
