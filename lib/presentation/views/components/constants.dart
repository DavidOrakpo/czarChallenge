import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class Constants {
  static const Color primaryDeepBlue = Color(0xFF1C3C54);
  static const Color primaryTortila = Color(0xFF997950);
  static const Color primaryRed = Color(0xFFE11900);
  static const Color primaryGreen = Color(0xFF048848);
  static const Color primaryOrange = Color(0xFFFF9D00);
  static const Color primaryBlue = Color(0xFF0A84FF);
  static const Color primaryPurple = Color(0xFF705BFA);
  static const Color primaryBlack = Color(0xFF181818);
  static const Color primaryGray4 = Color(0xFF666666);
  static const Color primaryGray3 = Color(0xFF979797);
  static const Color primaryGray2 = Color(0xFFD9D9D9);
  static const Color primaryGray1 = Color(0xFFF7F7F7);
  static const Color prmaryWhite = Color(0xFFFFFFFF);
  static const successColor = Color(0xFF00BF58);
  static const failureColor = Color(0xFFED2D2D);
  static Color transparentBlack = const Color(0X99181818).withOpacity(0.4);
  //Global NavKey
  static final navKey = GlobalKey<NavigatorState>();
  //! Font Sizes
  static const double h1 = 50.5;
  static const double h2 = 37.9;
  static const double h3 = 28.4;
  static const double h4 = 21.3;
  static const double h5 = 12;
  static const double p = 16;
  static const double small = 12;
  //! LISTS
  static const compartmentAIndex = [8, 9, 16, 17, 24, 25, 32, 33]; //8 items
  static const compartmentBIndex = [19, 20, 21, 22, 27, 28, 29, 30]; //8 items
  static const compartmentCIndex = [3, 5, 6, 44, 45, 46, 47]; // 7 items
  static const emptySeatSpace = [
    0,
    1,
    2,
    4,
    7,
    10,
    11,
    12,
    13,
    14,
    15,
    18,
    23,
    26,
    31,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
  ];

  // static var imageList = [
  //   ListItem("assets/images/image_fourpoints_two.png"),
  //   ListItem("assets/images/image_living_quaters.png"),
  //   ListItem("assets/images/prime_location.png"),
  //   ListItem("assets/images/coworking.png"),
  // ];
  //! FUNCTIONS

  static void showConfirmPopup(
      BuildContext rootContext, double height, double width) {
    showDialog(
      context: rootContext,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: height * 0.45,
                width: width * 0.7,
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : Theme.of(context).colorScheme.primaryContainer,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Image.asset(
                          "assets/images/image_hospital_vector_light.png"),
                      Center(
                        child: Text(
                          "Received",
                          style: AppTextStyle.bodyFive.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "Your message has been received and you will be responded to within 12hrs. Thanks.",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyThree.copyWith(
                            fontSize: 14,
                            color: AppColors.textGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void showPaymentError(
      BuildContext rootContext, double height, double width) {
    showDialog(
      context: rootContext,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: height * 0.45,
                width: width * 0.7,
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : Theme.of(context).colorScheme.primaryContainer,
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Image.asset("assets/images/image_error_light.png"),
                      Center(
                        child: Text(
                          "An error occured",
                          style: AppTextStyle.bodyFive.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "Check the transaction and try again.",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyThree.copyWith(
                            fontSize: 14,
                            color: AppColors.textGray,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          "Retry",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.headerFive.copyWith(
                            fontSize: 14,
                            color: AppColors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // static BoxBorder gradientBoxBorder(
  //     {LinearGradient? linearGradient, double width = 1}) {
  //   return GradientBoxBorder(
  //     gradient: (linearGradient == null)
  //         ? LinearGradient(
  //             colors: [
  //               const Color(0xFFD2E0ED).withOpacity(0.6),
  //               const Color(0xFFBFC8E7).withOpacity(0.6),
  //               const Color(0xFFF2DEED).withOpacity(0.6),
  //               const Color(0xFFCBCDFC).withOpacity(0.6),
  //               const Color(0xFFD5B8DF).withOpacity(0.6),
  //               const Color(0xFF9699B5).withOpacity(0.6),
  //             ],
  //             stops: const [
  //               0,
  //               0.11,
  //               0.3,
  //               0.56,
  //               0.8,
  //               1,
  //             ],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           )
  //         : linearGradient,
  //     width: width,
  //   );
  // }

  ///pass color code in this format #F345DE

}

//!EXTENSIONS
class MyScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
