import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Enums/enum.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/core/Utilities/Helpers/selection.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/pages/home_page.dart';
import 'package:template/presentation/views/components/primary_button.dart';
import 'package:template/presentation/views/onboarding/viewmodel/interest_viewmodel.dart';
import 'package:template/presentation/views/onboarding/widgets/interest_tile.dart';

class InterestPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "INTEREST_PAGE";
  const InterestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InterestPageState();
}

class _InterestPageState extends ConsumerState<InterestPage> {
  var selectableInterestsChip = Interests.values
      .mapIndexed((index, element) => SelectableItems(element))
      .toList();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(interestsVM);
    final themeProv = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        // systemOverlayStyle: themeProv.dynamicStatusBarOverlay(
        //   statusBarIconBrightness: Brightness.dark,
        //   statusBarColor: Colors.red,
        // ),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        leadingWidth: 30,
        titleSpacing: 0,
        title: SizedBox(
          height: 10,
          child: ValueListenableBuilder(
            valueListenable: viewModel.selectedInterests,
            builder: (context, interestList, child) =>
                TweenAnimationBuilder<double>(
              duration: 250.ms,
              tween: Tween(
                begin: 0,
                end: double.parse(interestList.length.toString()) / 6,
              ),
              builder: (context, value, child) => LinearProgressIndicator(
                value: value,
                // value: interestList.length / 6,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: viewModel.selectedInterests,
            builder: (context, interestList, child) => Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 10),
              child: Text(
                "${interestList.length}/6",
                style: AppTextStyle.bodyThree
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              .copyWith(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What interests you?",
                style: AppTextStyle.headerThree,
              ),
              Text(
                "Select all that applies",
                style: AppTextStyle.bodyThree.copyWith(
                  color: AppColors.textGray,
                  fontSize: 16,
                ),
              ),
              20.0.verticalSpace(),
              ValueListenableBuilder(
                valueListenable: viewModel.selectedInterests,
                builder: (context, interestList, child) => Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children:
                      selectableInterestsChip.mapIndexed((index, element) {
                    // var isSelected = interestList.
                    return InterestTile(
                      onTap: () {
                        if (!element.isSelected) {
                          if (interestList.length == 6) {
                            var temp = interestList.last;
                            var lastSelectedIndex = selectableInterestsChip
                                .indexWhere((element) => element == temp);
                            selectableInterestsChip[lastSelectedIndex]
                                .isSelected = false;
                          }

                          viewModel.incrementInterestList(element);
                          setState(() {
                            element.isSelected = true;
                          });
                        } else {
                          viewModel.decrementList();
                          setState(() {
                            element.isSelected = false;
                          });
                        }
                        // setState(() {
                        //   element.isSelected = !element.isSelected;
                        // });
                      },
                      title: element.data.title,
                      isSelected: element.isSelected,
                    );
                  }).toList(),
                ),
              ),
              20.0.verticalSpace(),
              InterestTile(
                title: "Add other +",
                isSelected: true,
              ),
              const Spacer(),
              PrimaryButton(
                width: double.infinity,
                text: "Continue",
                onPressed: () {
                  context.goNamed(HomePage.routeIdentifier);
                },
              ),
              5.0.verticalSpace(),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: TextButton(
                  onPressed: () {
                    context.goNamed(HomePage.routeIdentifier);
                  },
                  child: Text(
                    "Skip for now",
                    style: AppTextStyle.buttonText
                        .copyWith(color: AppColors.action),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
