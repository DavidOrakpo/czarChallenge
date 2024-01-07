import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.mulishTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: isDarkTheme ? AppColors.white : AppColors.black,
              displayColor: isDarkTheme ? AppColors.white : AppColors.black,
            )

        // .copyWith(

        //       // headline1: AppTextStyle.headerOne.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // headline2: AppTextStyle.headerTwo.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // headline3: AppTextStyle.headerThree.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // headline4: AppTextStyle.headerFour.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // headline5: AppTextStyle.headerFive.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // bodyText1: AppTextStyle.bodyOne.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // bodyText2: AppTextStyle.bodyTwo.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),
        //       // bodySmall: AppTextStyle.bodyThree.copyWith(
        //       //   color: isDarkTheme ? AppColors.white : AppColors.black,
        //       // ),

        //     ),
        ,
      ),
      //!Scaffold background color
      scaffoldBackgroundColor: isDarkTheme ? AppColors.black : AppColors.white,

      primaryColor: isDarkTheme ? Colors.white : Colors.black,
      //!Check Box Theme
      checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.resolveWith((states) {
            return AppColors.white;
          }),
          fillColor:
              MaterialStateProperty.resolveWith((states) => AppColors.purple)),
      //!Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 10,
          iconSize: 35,
          splashColor: AppColors.purple,
          backgroundColor: AppColors.purple,
          sizeConstraints: BoxConstraints(
            minHeight: 60,
            minWidth: 60,
          )),

      //! Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hintStyle: Theme.of(context)
            .textTheme
            .copyWith(
                bodyLarge: AppTextStyle.bodyOne.copyWith(
                    color: isDarkTheme
                        ? AppColors.gray.shade400
                        : AppColors.gray.shade300))
            .bodyLarge,
        alignLabelWithHint: true,
        labelStyle: Theme.of(context)
            .textTheme
            .copyWith(
                bodyLarge: AppTextStyle.bodyOne.copyWith(
                    color: isDarkTheme
                        ? AppColors.gray.shade200
                        : AppColors.gray.shade300))
            .bodyLarge,
        // floatingLabelStyle: TextStyle(color: widget.floatingLabelColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        isDense: true,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: isDarkTheme
            ? AppColors.gray.shade300.withOpacity(0.3)
            : AppColors.gray.shade500.withOpacity(0.5),
      ),
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      // highlightColor: isDarkTheme
      //     ? const Color(0xff372901)
      //     : Constants.primaryDeepBlue.withOpacity(0.3),
      // hoverColor:
      //     isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      //! Circular Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: Color(0xFFD9D9D9),
        color: AppColors.primary,
      ),
      //!Tab Bar Theme
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        unselectedLabelColor: AppColors.textGray,
        labelColor: isDarkTheme ? AppColors.black : AppColors.black,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),

      //!App Bar Theme
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          iconTheme: IconThemeData(
              color: isDarkTheme ? AppColors.white : AppColors.black)),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        // secondary: AppColors.purple,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        //! Entry Field Color
        secondaryContainer: isDarkTheme
            ? AppColors.black2
            : AppColors.gray.shade500.withOpacity(0.5),
        tertiaryContainer:
            isDarkTheme ? AppColors.black3 : AppColors.defaultContainerColor,
        primaryContainer:
            !isDarkTheme ? AppColors.defaultContainerColor : AppColors.black3,
        //!General Text Color
        inversePrimary: isDarkTheme ? AppColors.white : AppColors.black,
      ).copyWith(
          background: isDarkTheme ? Colors.black : const Color(0xffF1F5FB)),
    );
  }
}
