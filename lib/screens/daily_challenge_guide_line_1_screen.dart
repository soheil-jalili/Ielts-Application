import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/daily_challenge_guide_line_2_screen.dart';
import 'package:ielts/widgets/back_quiz.dart';
import 'package:ielts/widgets/button_primary.dart';

class DailyChallengeGuideLine1Screen extends StatelessWidget {
  const DailyChallengeGuideLine1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.shadowWhiteColor,
                    ),
                  ],
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: SvgPicture.asset(
                                Assets.images.dailyChallengeLeftShape,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: SvgPicture.asset(
                                Assets.images.dailyChallengeRightShape,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 140),
                              child: SvgPicture.asset(
                                Assets.images.dailyChallengeGuideLine1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 24),
                            child: Center(
                              child: Text(
                                'چالش های روزانه',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: FontFamily.iranSansXBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'بازی کن، '),
                            TextSpan(
                              text: 'امتیاز ',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const TextSpan(text: 'بگیر، با'),
                            TextSpan(
                              text: ' تخفیف',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const TextSpan(text: ' یاد بگیر!'),
                          ],
                        ),
                        style: TextStyle(
                          color: AppColors.subTextQuizScreenColor,
                          fontSize: 22,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'ما در این اپلیکیشن برای شما امکانی را فراهم\n'
                          'کرده ایم تا شما با بازی های روزانه در سطوح مختلف\n'
                          'امکان استفاده از تخفیفات عالی در دوره های مجموعه‌ی\n'
                          '‌ما بهره‌مند شوید!',
                          style: TextStyle(
                            color: AppColors.subTextQuizScreenColor,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXRegular,
                            height: 2.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: ButtonPrimary(
                          title: 'بزن بریم',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DailyChallengeGuideLine2Screen(),
                              ),
                            );
                          },
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BackQuiz(onTap: () {}),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
