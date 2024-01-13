import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';

class ComingSoonPage extends StatelessWidget {
  static const routeIdentifier = "COMING_SOON";
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (size.height * 0.1).verticalSpace(),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/coming_soon.png",
              ),
            ),
            (size.height * 0.01).verticalSpace(),
            Align(
              alignment: const Alignment(0.6, 0),
              child: SvgPicture.asset(
                "assets/icons/spinning_loader.svg",
                height: 30,
                width: 30,
                color: AppColors.action,
              ),
            ),
            (size.height * 0.01).verticalSpace(),
            Text(
              "Coming Soon!",
              style: AppTextStyle.headerOne.copyWith(
                fontSize: 32,
                color: AppColors.action,
              ),
            ),
            (10.0).verticalSpace(),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.46,
                child: Text(
                  "We'll be up soon, keep an eye on us",
                  style: AppTextStyle.bodyThree.copyWith(
                    fontSize: 16,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.7, 0),
              child: SvgPicture.asset(
                "assets/icons/lightning_bolt.svg",
                height: 30,
                width: 30,
                color: AppColors.action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
