import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/components/primary_button.dart';

class SpeakingPage extends StatefulWidget {
  static const routeIdentifier = "SPEAKING_PAGE";
  const SpeakingPage({super.key});

  @override
  State<SpeakingPage> createState() => _SpeakingPageState();
}

class _SpeakingPageState extends State<SpeakingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
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
          child: LinearProgressIndicator(
            value: 0.6,
            // value: interestList.length / 6,
            borderRadius: BorderRadius.circular(20),
          ).padding(padding: const EdgeInsets.only(right: 40)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              .copyWith(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Speak this sentence",
                style: AppTextStyle.headerFour.copyWith(
                  // fontSize: 20,
                  color: const Color(0xFF616161),
                ),
              ),
              (size.height * 0.08).verticalSpace(),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: AppColors.action,
                  child: Icon(
                    Icons.volume_up_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
              (size.height * 0.04).verticalSpace(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Bonjour, Buchi, enchante",
                  style: AppTextStyle.headerFour.copyWith(
                    // fontSize: 20,

                    decoration: TextDecoration.underline,
                    color: const Color(0xFF616161),
                  ),
                ),
              ),
              (size.height * 0.15).verticalSpace(),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/icons/microphone.png",
                ),
              ),
              const Spacer(),
              Text(
                "Brilliant!",
                style: AppTextStyle.bodyThree.copyWith(
                  fontSize: 20,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (size.height * 0.02).verticalSpace(),
              Text(
                "Meaning:",
                style: AppTextStyle.bodyThree.copyWith(
                  fontSize: 16,
                  height: 1,
                ),
              ),
              (size.height * 0.02).verticalSpace(),
              Text(
                "Hello, Buchi, nice to meet you.",
                style: AppTextStyle.bodyThree.copyWith(
                  fontSize: 16,
                  height: 1,
                ),
              ),
              (size.height * 0.04).verticalSpace(),
              PrimaryButton(
                width: double.infinity,
                onPressed: () {},
                text: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }
}
