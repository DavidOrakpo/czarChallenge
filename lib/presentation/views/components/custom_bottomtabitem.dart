import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'constants.dart';

class CustomTabItem extends ConsumerStatefulWidget {
  CustomTabItem({
    Key? key,
    this.onTap,
    this.text,
    this.largeText = false,
    this.iconWidth,
    required this.assignedIndex,
    this.iconSize,
    this.focusNode,
    this.selectedIconPath,
    this.defaultIconPath,
    required this.selectedIndex,
  })  : isSelected = (selectedIndex == assignedIndex),
        super(key: key);
  int? assignedIndex, selectedIndex;
  double? iconSize, iconWidth;
  FocusNode? focusNode;
  final void Function()? onTap;
  String? text, defaultIconPath, selectedIconPath;
  final bool? largeText, isSelected;

  @override
  ConsumerState<CustomTabItem> createState() => _CustomTabItemState();
}

class _CustomTabItemState extends ConsumerState<CustomTabItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Focus(
        focusNode: widget.focusNode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Badge(
              isLabelVisible: false,
              // badgeColor: Constants.primaryDeepBlue,
              // position: const BadgePosition(top: -15, end: -13),
              // animationType: BadgeAnimationType.fade,
              // showBadge:
              //     context.watch<SupportProvider>().messageFromAdminCount >
              //             0
              //         ? true
              //         : false,
              // badgeContent: Text(
              //   context
              //       .watch<SupportProvider>()
              //       .messageFromAdminCount
              //       .toString(),
              //   style: const TextStyle(color: Constants.prmaryWhite),
              // ),
              child: Image.asset(
                widget.isSelected!
                    ? widget.selectedIconPath!
                    : widget.defaultIconPath!,
                height: widget.iconSize ?? 24,
                width: widget.iconWidth ?? 24,
                color: (widget.selectedIndex == widget.assignedIndex)
                    ? null
                    : AppColors.gray.shade300,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.text ?? "Home",
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyFour.copyWith(
                // fontWeight: FontWeight.bold,
                // fontSize: widget.largeText! ? 12.5 : 16,
                color: (widget.selectedIndex == widget.assignedIndex)
                    ? AppColors.primary
                    : ref.watch(themeProvider).darkTheme
                        ? AppColors.gray.shade200
                        : AppColors.gray.shade400,
              ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            // Container(
            //   height: 3,
            //   width: widget.selectedIndex == 2 ? 50 : 50,
            //   decoration: BoxDecoration(
            //       color: widget.isSelected!
            //           ? AppColors.primary
            //           : Colors.transparent,
            //       borderRadius: BorderRadius.circular(20)),
            // )
          ],
        ),
      ),
    );
  }
}
