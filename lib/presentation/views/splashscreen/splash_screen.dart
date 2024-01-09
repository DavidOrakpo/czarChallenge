import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'dart:math' as math;
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/darkMode_provider.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/onboarding/pages/interests.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "SPLASH_SCREEN_PAGE";
  const SplashScreenPage({super.key});

  @override
  ConsumerState<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(
        const Duration(
          milliseconds: 4600,
        ),
        () {
          context.pushNamed(InterestPage.routeIdentifier);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProv = ref.watch(themeProvider);

    List<Widget> chatTextsVectors = [
      Align(
        alignment: const Alignment(0.93, -0.07 + 0.1),
        child: SvgPicture.asset(
          "assets/images/text_line_one.svg",
        ),
      ),
      Align(
        alignment: const Alignment(0.9, -0.04 + 0.1),
        child: SvgPicture.asset(
          "assets/images/text_line_two.svg",
        ),
      ),
    ];

    List<Widget> maleChatLines = [
      Align(
        alignment: const Alignment(-0.25, 0.23),
        child: SvgPicture.asset(
          "assets/images/male_text_line_one.svg",
        ),
      ),
      Align(
        alignment: const Alignment(-0.23, 0.24),
        child: SvgPicture.asset(
          "assets/images/male_text_line_two.svg",
        ),
      ),
      Align(
        alignment: const Alignment(-0.225, 0.26),
        child: SvgPicture.asset(
          "assets/images/male_text_line_three.svg",
        ),
      ),
    ];

    maleChatLines =
        maleChatLines.animate(interval: 800.ms, delay: 200.ms).fadeIn();

    chatTextsVectors =
        chatTextsVectors.animate(interval: 800.ms, delay: 1600.ms).fadeIn();
    return AnnotatedRegion(
      value: themeProv.dynamicStatusBarOverlay(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF000000),
                      Color(0xFF884848),
                    ],
                    stops: [
                      0,
                      1,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                "assets/images/topography_1.png",
                color: const Color(0xFFFF7562).withOpacity(0.05),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              right: -40,
              child: SvgPicture.asset(
                "assets/images/spinning_vector_2.svg",
                height: 80,
                width: 80,
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .rotate(duration: 8.seconds),
            ),
            Align(
              alignment: const Alignment(-0.4, -0.75),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                    width: 30,
                  ).animate(delay: 2400.ms).crossfade(
                        duration: 700.ms,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SvgPicture.asset("assets/icons/app_icon.svg"),
                        ).animate().fadeIn(duration: 700.ms).scale(),
                      ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                'Speak',
                                style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = AppColors.primary,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                'Speak',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Sphere',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ).animate().fadeIn(duration: 1.seconds),
                      Stack(
                        children: [
                          Text(
                            '...speak the world',
                            style: TextStyle(
                              fontSize: 16,
                              height: 0,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.italic,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = AppColors.primary,
                            ),
                          ),
                          const Text(
                            '...speak the world',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      )
                          .animate(delay: 3700.ms)
                          .fadeIn()
                          .then()
                          .shimmer(color: AppColors.primary, duration: 450.ms)
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(-1, 0.35),
              child: SvgPicture.asset(
                "assets/images/maile_person.svg",
              ),
            ),
            Align(
              alignment: const Alignment(1, 0.7),
              child: SvgPicture.asset(
                "assets/images/femaile_person.svg",
                allowDrawingOutsideViewBox: true,
              ),
            ),
            Align(
              alignment: const Alignment(1, 0.1),
              child: Transform.translate(
                offset: const Offset(0, -5),
                child: Transform.rotate(
                  angle: -(math.pi / 4) / 30,
                  child: SvgPicture.asset(
                    "assets/images/inner_chat_bubble.svg",
                    // color: Colors.purple,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, 0.1),
              child: SvgPicture.asset(
                "assets/images/outter_chat_bubble.svg",
              ),
            ),
            ...maleChatLines,
            ...chatTextsVectors
          ],
        ),
      ),
    );
  }
}
