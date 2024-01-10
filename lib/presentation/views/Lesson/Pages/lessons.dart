import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enum.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/widgets/mini_app_bar.dart';
import 'package:template/presentation/views/Lesson/Pages/parallax.dart';

class LessonsPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "LESSONS_PAGE";
  const LessonsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonsPageState();
}

class _LessonsPageState extends ConsumerState<LessonsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacings.horizontalPadding.copyWith(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: MiniAppBar(),
                ),
              ),
              30.0.verticalSpace(),
              Container(
                height: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.textGray,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        "Audio Lesson",
                        style: AppTextStyle.bodyThree,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Video Lesson",
                        style: AppTextStyle.bodyThree,
                      ),
                    ),
                  ],
                ),
              ),
              20.0.verticalSpace(),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.separated(
                      itemCount: Lessons.values.length,
                      separatorBuilder: (context, index) =>
                          30.0.verticalSpace(),
                      itemBuilder: (context, index) {
                        var item = Lessons.values[index];
                        return LessonItem(
                          imageUrl: item.assetImage,
                          name: item.lessonName,
                          iconColor: item.iconColor,
                          details: item.details,
                        );
                      },
                    ),
                    // Container(
                    //   color: Colors.red,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(
                    //           horizontal: 15,
                    //           vertical: 10,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // child: ExampleParallax(),
      ),
    );
  }
}
