import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Enums/enum.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/components/primary_button.dart';

class ProfilePage extends StatefulWidget {
  static const routeIdentifier = "PROFILE_PAGE";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        // titleSpacing: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppTextStyle.bodyThree.copyWith(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Icon(
            Icons.settings_outlined,
          ).padding(
            padding: const EdgeInsets.only(
              right: 17,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSpacings.horizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Hero(
                      tag: "profileImage",
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: const Color(0xFFFFBFB6),
                              child: Image.asset(
                                "assets/icons/profile_iicon.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: AppColors.action,
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                5.0.verticalSpace(),
                Center(
                  child: Text(
                    "Buchi Allwell",
                    style: AppTextStyle.headerOne,
                  ),
                ),
                // 10.0.verticalSpace(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: AppColors.textGray,
                        size: 15,
                      ),
                      5.0.horizontalSpace(),
                      Text(
                        "Joined since 30 Dec 2023",
                        style: AppTextStyle.bodyFive.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColors.textGray,
                        ),
                      )
                    ],
                  ),
                ),
                20.0.verticalSpace(),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "1107",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "followers",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 16,
                                color: AppColors.textGray,
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.textGray,
                        thickness: 1,

                        // indent: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "313",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "following",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 16,
                                color: AppColors.textGray,
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.textGray,
                        thickness: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "11,307",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "lifetime XP",
                              style: AppTextStyle.bodyThree.copyWith(
                                fontSize: 16,
                                color: AppColors.textGray,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                15.0.verticalSpace(),
                Center(
                  child: PrimaryButton(
                    icon: Icons.edit,
                    cornerRadius: 12,
                    iconColor: AppColors.white,
                    backgroundColor: AppColors.action,
                    hasIcon: true,
                    text: "Edit Profile",
                    onPressed: () {},
                  ),
                ),
                25.0.verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Your Statistics",
                    ),
                    5.0.horizontalSpace(),
                    const Icon(
                      Icons.bar_chart,
                      color: AppColors.action,
                    )
                  ],
                ),
                20.0.verticalSpace(),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: ProfileStats.values.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = ProfileStats.values[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.textGray.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          item.isSVG
                              ? SvgPicture.asset(
                                  item.imageAsset,
                                  height: 23,
                                  width: 23,
                                )
                              : Image.asset(
                                  item.imageAsset,
                                  height: 30,
                                  width: 30,
                                ),
                          7.0.horizontalSpace(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.amount,
                                style: AppTextStyle.bodyThree.copyWith(),
                              ),
                              3.0.verticalSpace(),
                              Text(
                                item.title,
                                maxLines: 1,
                                style: AppTextStyle.bodyThree.copyWith(
                                    fontSize: 15, overflow: TextOverflow.fade),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
