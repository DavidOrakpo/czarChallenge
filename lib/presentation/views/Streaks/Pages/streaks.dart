import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Streaks/Widgets/streak_item.dart';
import 'package:template/presentation/views/components/primary_button.dart';

class StreaksPage extends StatefulWidget {
  static const routeIdentifier = "STREAKS_PAGE";
  const StreaksPage({super.key});

  @override
  State<StreaksPage> createState() => _StreaksPageState();
}

class _StreaksPageState extends State<StreaksPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacings.horizontalPadding.copyWith(
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.chevron_left_rounded,
                  ),
                ),
              ),
              (size.height * 0.12).verticalSpace(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/app_icon.svg",
                      height: 30,
                      width: 30,
                      alignment: Alignment.bottomLeft,
                      color: AppColors.textGray,
                    ),
                    // 15.0.verticalSpace(),
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 130,
                            height: 1,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = AppColors.primary,
                          ),
                        ),
                        // Solid text as fill.
                        const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 130,
                            height: 1,
                            color: AppColors.action,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (0.08).verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "days streak!",
                    style: AppTextStyle.headerTwo.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  5.0.horizontalSpace(),
                  Image.asset(
                    "assets/icons/fire_icon.png",
                    scale: 2,
                  ),
                ],
              ),
              (size.height * 0.05).verticalSpace(),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        blurRadius: 8,
                        spreadRadius: 5,
                        color: AppColors.gray.shade400.withOpacity(0.3),
                      )
                    ]),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StreakItem(
                                title: "Mon",
                                onStreak: true,
                              ),
                              StreakItem(
                                title: "Tue",
                                onStreak: true,
                              ),
                              StreakItem(
                                title: "Wed",
                                onStreak: false,
                              ),
                              StreakItem(
                                title: "Thu",
                                onStreak: false,
                              ),
                              StreakItem(
                                title: "Fri",
                                onStreak: false,
                              ),
                              StreakItem(
                                title: "Sat",
                                onStreak: false,
                              ),
                            ],
                          ),
                          15.0.verticalSpace(),
                          FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Text(
                              "You're on a roll, great job! Practice each day to keep up with your streak and earn XP points.",
                              style: AppTextStyle.bodyThree,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                width: double.infinity,
                text: "Continue",
                onPressed: () {
                  // context.goNamed(HomePage.routeIdentifier);
                },
              ),
              5.0.verticalSpace(),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: TextButton(
                  onPressed: () {
                    // context.goNamed(HomePage.routeIdentifier);
                  },
                  child: Text(
                    "Share",
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
