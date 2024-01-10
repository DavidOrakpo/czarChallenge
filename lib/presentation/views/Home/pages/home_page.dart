import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/widgets/mini_app_bar.dart';
import 'package:template/presentation/views/Home/widgets/sphere_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  static const routeIdentifier = "HOME_PAGE";
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSpacings.horizontalPadding.copyWith(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: MiniAppBar(),
                    ),
                    15.0.horizontalSpace(),
                    CircleAvatar(
                      backgroundColor: const Color(0xFFFFBFB6),
                      child: Image.asset(
                        "assets/icons/profile_icon.png",
                        height: 70,
                        width: 70,
                      ),
                    )
                  ],
                ),
                40.0.verticalSpace(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your",
                      style: AppTextStyle.headerTwo.copyWith(
                        color: AppColors.action,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Learning Sphere",
                          style: AppTextStyle.headerTwo.copyWith(
                            color: AppColors.action,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/sphere.svg",
                          height: 25,
                          width: 25,
                        )
                      ],
                    ),
                  ],
                ),
                20.0.verticalSpace(),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                  ),
                  children: [
                    const SphereTile(
                      imagePath: "assets/icons/noto-open-book.svg",
                      title: "Reading",
                      completionPercent: 0.5,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/emojione-headphone.svg",
                      title: "Listening",
                      completionPercent: 0.5,
                    ),
                    const SphereTile(
                      imagePath:
                          "assets/icons/emojione-writing-hand-medium-skin-tone.svg",
                      title: "Writing",
                      completionPercent: 0.7,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/twemoji-speaking-head.svg",
                      title: "Speaking",
                      completionPercent: 0.25,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/fxemoji-books.svg",
                      title: "Books",
                      completionPercent: 0.8,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/group.svg",
                      title: "Quizzes",
                      completionPercent: 0.4,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/fxemoji-books.svg",
                      title: "Books",
                      completionPercent: 0.8,
                    ),
                    const SphereTile(
                      imagePath: "assets/icons/group.svg",
                      title: "Quizzes",
                      completionPercent: 0.4,
                    ),
                    // SphereTile(
                    //   imagePath: "assets/icons/noto_puzzle-piece.svg",
                    //   title: "Reading",
                    //   completionPercent: 0.5,
                    // ),
                    // SphereTile(
                    //   imagePath: "assets/icons/puzzle.svg",
                    //   title: "Gaming",
                    //   completionPercent: 0.6,
                    // )
                  ]
                      .animate(interval: 300.ms)
                      .fadeIn(duration: 250.ms)
                      .slideY(begin: 1),
                ),
                // GridView.builder(
                //   itemCount: 10,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 4 / 3,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 20,
                //   ),
                //   itemBuilder: (context, index) {
                //     return const SphereTile(
                //       imagePath: "assets/icons/noto-open-book.svg",
                //       title: "Reading",
                //       completionPercent: 0.5,
                //     ).animate().fadeIn(delay: 100.ms);
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
