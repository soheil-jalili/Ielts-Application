import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/title_icon.dart';

class DailyChecklistScreen extends StatelessWidget {
  const DailyChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 32),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    TitleIcon(
                      title: 'چک لیست روزانه',
                      fontSize: 18,
                      textColor: Colors.black,
                    ),
                    Spacer(),
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
                          SizedBox(width: 10),
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
                margin: EdgeInsets.symmetric(horizontal: 41),
                height: 271,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.containerDailyCheckListColor,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        Assets.images.shapeDailyChecklist.path,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        Assets.images.shapeLeftBottomDailyChecklist.path,
                      ),
                    ),

                    Positioned.fill(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                34,
                                56,
                                34,
                                47,
                              ),
                              child: Text(
                                'هر روز یک قدم کوچک به سمت تسلط به زبان! چک‌لیست امروز رو کامل کن و به هدفت نزدیک‌تر شو.',
                                maxLines: 3,
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXMedium,
                                  fontSize: 18,
                                  color: Colors.black,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 59),
                              child: ButtonPrimary(
                                title: 'بزن بریم!',
                                onPressed: () {},
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

            SliverPadding(
              padding: const EdgeInsets.only(top: 72, bottom: 34, right: 30),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    TitleIcon(
                      title: 'نحوه کار با چک لیست روزانه',
                      fontSize: 18,
                      textColor: Colors.black,
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(Assets.images.infoGrey),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      Assets.images.typeForDailyChecklist,
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 195,
                      margin: EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 48,
                            spreadRadius: -10,
                            color: AppColors.shadowWhiteColor,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20.5, 16, 20.5, 16),
                      child: Text(
                        'برای استفاده از چک‌لیست روزانه آیلتس، هر روز وارد اپلیکیشن شوید و وظایف تعیین‌شده مانند تمرین لغات، خواندن، نوشتن و گوش دادن را انجام دهید. با تکمیل هر تسک، علاوه بر تقویت مهارت‌های آیلتس، امتیاز کسب کرده و به جوایز و سطوح بالاتر دست می‌یابید.',
                        style: TextStyle(
                          color: AppColors.dailyChecklistSubTextColor,
                          fontSize: 10,
                          fontFamily: FontFamily.iranSansXMedium,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
