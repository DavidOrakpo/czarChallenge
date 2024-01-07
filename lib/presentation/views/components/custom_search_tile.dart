import 'package:flutter/material.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class SearchTile extends StatefulWidget {
  EdgeInsets? padding;
  SearchTile({super.key, this.padding});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Search...",
                    textAlign: TextAlign.left,
                    style: AppTextStyle.bodyFive.copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.gray.shade300.withOpacity(0.6)
                          : AppColors.gray.shade400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040));
                    },
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.gray
                          : AppColors.textGray,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.filter_list)
        ],
      ),
    );
  }
}
