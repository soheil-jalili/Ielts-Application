import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/title_icon.dart';

class DailyChecklistDetailScreen extends StatelessWidget {
  const DailyChecklistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(30, 32, 30, 24),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      TitleIcon(
                        title: 'چک لیست روزانه',
                        fontSize: 18,
                        textColor: Colors.black,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'تاریخ :1403/02/16',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: FontFamily.iranSansXRegular,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(Assets.images.downDailyChecklist),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 24,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 27),
                  height: 272,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 16),
                        blurRadius: 32,
                        spreadRadius: -10,
                        color:
                            AppColors.dailyChecklistDetailContainerShadowColor,
                      ),
                    ],
                  ),
                  child: CustomScrollView(
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 5,
                          (context, index) => const ChecklistItemWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(30, 24, 30, 24),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      TitleIcon(
                        title: 'چک لیست روزانه',
                        fontSize: 18,
                        textColor: Colors.black,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'تاریخ :1403/02/16',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: FontFamily.iranSansXRegular,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(Assets.images.downDailyChecklist),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 24,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 27),
                  height: 272,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 16),
                        blurRadius: 32,
                        spreadRadius: -10,
                        color:
                            AppColors.dailyChecklistDetailContainerShadowColor,
                      ),
                    ],
                  ),
                  child: CustomScrollView(
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 5,
                          (context, index) => const ChecklistItemWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChecklistItemWidget extends StatefulWidget {
  const ChecklistItemWidget({super.key});

  @override
  State<ChecklistItemWidget> createState() => _ChecklistItemWidgetState();
}

class _ChecklistItemWidgetState extends State<ChecklistItemWidget> {
  bool isCompleted = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color getContainerColor() {
      if (isExpanded) {
        return AppColors.primary500Color;
      }
      if (isCompleted) {
        return AppColors.primary50Color;
      }
      return AppColors.dailyChecklistDetailContainerBackgroundColor;
    }

    Color getTextColor() {
      if (isExpanded) {
        return Colors.white;
      }
      if (isCompleted) {
        return AppColors.primary500Color;
      }
      return AppColors.black950Color;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: isExpanded ? 8 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckBoxDailyChecklistDetail(
            isCompleted: isCompleted,
            onTap: () {
              setState(() {
                isCompleted = !isCompleted;
              });
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: getContainerColor(),
                      border: isCompleted && !isExpanded
                          ? Border.all(
                              width: 0.7,
                              color: AppColors.primary500Color,
                            )
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تمرین گفتگو',
                          style: TextStyle(
                            color: getTextColor(),
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                        Text(
                          'زمان: 7 دقیقه',
                          style: TextStyle(
                            color: getTextColor(),
                            fontSize: 8,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                        Transform.rotate(
                          angle: isExpanded ? math.pi : 0,
                          child: SvgPicture.asset(
                            Assets.images.downDailyChecklist,
                            colorFilter: ColorFilter.mode(
                              getTextColor(),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isExpanded)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 27,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors
                          .dailyChecklistDetailContainerDetailBackgroundColor,
                    ),
                    child: Text(
                      '''1. ضبط 2 دقیقه مکالمه درباره موضوعات رایج آیلتس
2. بازبینی مکالمه و یادداشت نقاط ضعف آن''',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontFamily: FontFamily.iranSansXMedium,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBoxDailyChecklistDetail extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback onTap;

  const CustomCheckBoxDailyChecklistDetail({
    super.key,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isCompleted
              ? AppColors.primary500Color
              : AppColors.dailyChecklistDetailCheckBoxBackgroundColor,
        ),
        child: isCompleted
            ? Padding(
                padding: const EdgeInsets.fromLTRB(9, 11, 9, 10.71),
                child: SvgPicture.asset(Assets.images.tick),
              )
            : null,
      ),
    );
  }
}