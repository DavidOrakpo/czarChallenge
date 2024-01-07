// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/components/inputField.dart';
import 'package:template/presentation/views/components/single_field_input.dart';

import '../../styles/app_colors.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? entryBackground;
  final Widget? suffWidget;
  final Widget? prefixWidget;
  final void Function(String)? onFieldSubmitted;
  List<TextInputFormatter>? inputFormatters;
  int? maxLines, maxLength;
  bool? hasSuffixIcon;
  bool? isUnderLineBorder;
  bool? obscureText;
  FocusNode? focusNode;
  bool? filled;
  final String? labelText;
  FloatingLabelBehavior? floatingLabelBehavior;
  Widget? validatorWidget;
  final String? hintText;
  CustomTextField({
    Key? key,
    this.validator,
    this.isUnderLineBorder = false,
    this.controller,
    this.entryBackground,
    this.filled = false,
    this.floatingLabelBehavior,
    this.onFieldSubmitted,
    this.suffWidget,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.validatorWidget,
    this.focusNode,
    this.prefixWidget,
    this.obscureText = false,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final themeProv = ref.watch(themeProvider);
    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.always,
      builder: (field) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: widget.isUnderLineBorder!
                  ? SingleFieldInputWidget(
                      controller: widget.controller,
                      validator: null,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      labelText: widget.labelText,
                      focusNode: widget.focusNode,
                      floatingLabelBehavior: widget.floatingLabelBehavior,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      keyboardType: TextInputType.number,
                      style: AppTextStyle.bodyOne.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: field.hasError
                            ? AppColors.errorColor
                            : themeProv.darkTheme
                                ? AppColors.white
                                : AppColors.black,
                      ),
                      decoration: InputDecoration(
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.errorColor),
                        ),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: field.hasError
                                ? AppColors.errorColor
                                : AppColors.primary,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: field.hasError
                                ? AppColors.errorColor
                                : AppColors.primary,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: field.hasError
                                ? AppColors.errorColor
                                : AppColors.primary,
                          ),
                        ),
                        hintText: widget.hintText,
                        errorStyle: AppTextStyle.bodyTwo.copyWith(
                          color: AppColors.errorColor,
                        ),

                        // fillColor: entryBackground,
                        floatingLabelBehavior: widget.floatingLabelBehavior,
                        label: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.labelText ?? "Enter Label Text...",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyOne.copyWith(
                              fontSize: 16,
                              color: themeProv.darkTheme
                                  ? AppColors.gray.shade400
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    )
                  : InputFieldWidget(
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      inputFormatters: widget.inputFormatters,
                      obscureText: widget.obscureText,
                      controller: widget.controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: field.hasError
                                ? AppColors.errorColor
                                : AppColors.gray.shade400,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: field.hasError
                                  ? AppColors.errorColor
                                  : AppColors.gray.shade400),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: AppColors.errorColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: field.hasError
                                  ? AppColors.errorColor
                                  : AppColors.primary),
                        ),
                        hintText: widget.hintText,
                        floatingLabelBehavior: widget.floatingLabelBehavior ??
                            FloatingLabelBehavior.always,
                        filled: widget.filled,
                        fillColor: widget.entryBackground,
                        labelText: widget.labelText ?? "Enter Label Text...",
                        suffixIcon: widget.suffWidget,
                        prefixIcon: widget.prefixWidget,
                        prefixIconColor: AppColors.gray.shade300,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      onChanged: (value) {
                        field.didChange(value);
                      },
                    ),
            ),
            if (field.hasError) ...[
              widget.validatorWidget ??
                  Container(
                    width: double.infinity,
                    // height: 38,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCF2F1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      field.errorText!,
                      style: AppTextStyle.bodyFive.copyWith(
                        color: AppColors.errorColor,
                      ),
                    ),
                  ),
            ]
          ],
        );
      },
    );
  }
}
