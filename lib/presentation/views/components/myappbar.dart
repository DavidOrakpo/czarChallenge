import 'package:flutter/material.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key, this.onTap, this.title, this.trailingWidget})
      : super(key: key);
  final void Function()? onTap;
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
  final String? title;
  Widget? trailingWidget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 70,
      leadingWidth: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title ?? "Space Details",
        style: AppTextStyle.headerFive.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.white
                : AppColors.black),
      ),
      leading: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.chevron_left),
                Text(
                  "Back",
                  style: AppTextStyle.bodyTwo.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.white
                          : AppColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          // height: 40,
          // width: 40,
          child: trailingWidget ?? const SizedBox.shrink(),
        )
      ],
    );
  }
}
