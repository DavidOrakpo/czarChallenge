import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class InterestTile extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  bool isSelected;
  InterestTile({
    super.key,
    required this.title,
    this.onTap,
    this.isSelected = false,
  });

  @override
  State<InterestTile> createState() => _InterestTileState();
}

class _InterestTileState extends State<InterestTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(30),
      child: widget.isSelected
          ? Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.action,
                  width: 1,
                ),
              ),
              child: Text(
                widget.title,
                style: AppTextStyle.bodyThree.copyWith(color: AppColors.white),
              ),
            )
          : DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [8, 2],
              radius: const Radius.circular(30),
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Text(
                  widget.title,
                  style:
                      AppTextStyle.bodyThree.copyWith(color: AppColors.black),
                ),
              ),
            ),
    );
  }
}
