import 'package:flutter/material.dart';

import 'constants.dart';

class InfoDropDown extends StatefulWidget {
  const InfoDropDown(
      {Key? key,
      this.dropdownvalue,
      this.isExpanded = true,
      this.iconColor,
      this.hintText,
      this.height,
      this.borderColor,
      this.hintColor,
      this.trailingWidget,
      this.hintFontSize = 12,
      this.items,
      required this.onChanged})
      : super(key: key);
  final String? dropdownvalue, hintText;
  final List<DropdownMenuItem<String>>? items;
  final bool? isExpanded;
  final Widget? trailingWidget;
  final Color? iconColor, borderColor, hintColor;
  final void Function(String?)? onChanged;
  final double? height, hintFontSize;
  @override
  State<InfoDropDown> createState() => _InfoDropDownState();
}

class _InfoDropDownState extends State<InfoDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: widget.borderColor ?? Constants.primaryGray2,
        ),
      ),
      child: DropdownButton(
          value: widget.dropdownvalue,
          icon: widget.trailingWidget ?? const Icon(Icons.arrow_drop_down),
          hint: Text(
            widget.hintText ?? "Select",
            style: TextStyle(
                color: widget.hintColor ?? Constants.primaryGray2,
                fontSize: widget.hintFontSize),
          ),
          iconEnabledColor: widget.iconColor ?? Constants.primaryOrange,
          isExpanded: widget.isExpanded ?? true,
          underline: const SizedBox(),
          style: const TextStyle(color: Constants.primaryBlack),
          items: widget.items ??
              const [
                DropdownMenuItem(
                  value: "Mr.",
                  child: Text("Mr."),
                ),
                DropdownMenuItem(
                  value: "Mrs.",
                  child: Text(
                    "Mrs.",
                    style: TextStyle(color: Constants.primaryBlack),
                  ),
                ),
                DropdownMenuItem(
                  value: "Ms.",
                  child: Text("Ms."),
                )
              ],
          onChanged: widget.onChanged ?? (value) {}),
    );
  }
}
