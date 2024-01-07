import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';

import '../../styles/app_colors.dart';

class InputFieldWidget extends ConsumerWidget {
  final TextEditingController? controller;
  final Color? entryBackground;
  final String? labelText;
  final String? hintText;
  InputDecoration? decoration;
  final Widget? suffWidget;
  final int? maxLines;
  List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixWidget;
  void Function(String)? onChanged;
  bool? hasSuffixIcon;
  bool? hasPreffixIcon;
  bool? obscureText;
  final String? Function(String?)? validator;
  InputFieldWidget({
    super.key,
    required this.controller,
    this.entryBackground,
    this.hintText,
    this.hasSuffixIcon = false,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.onFieldSubmitted,
    this.labelText,
    this.hasPreffixIcon = false,
    this.prefixWidget,
    this.onChanged,
    this.obscureText = false,
    this.decoration,
    this.validator,
    this.suffWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(themeProvider);
    return TextFormField(
      keyboardAppearance:
          darkTheme.darkTheme ? Brightness.dark : Brightness.light,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText!,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: decoration ??
          InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gray.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gray.shade400),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.errorColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            hintText: hintText,
            fillColor: entryBackground,
            labelText: labelText ?? "Enter Label Text...",
            suffixIcon: suffWidget ?? const SizedBox(),
            prefixIcon: prefixWidget ?? const SizedBox(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
      controller: controller,
      validator: validator,
    );
  }
}
