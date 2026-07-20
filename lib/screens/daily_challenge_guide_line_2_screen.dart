import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/daily_challenge_games_screen.dart';
import 'package:ielts/widgets/back_quiz.dart';
import 'package:ielts/widgets/button_primary.dart';

class DailyChallengeGuideLine2Screen extends StatelessWidget {
  const DailyChallengeGuideLine2Screen({super.key});

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
                              padding: const EdgeInsets.only(top: 80),
                              child: SvgPicture.asset(
                                Assets.images.dailyChallengeGuidLine2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 24),
                            child: Center(
                              child: Text(
                                'توضیحات چالش روزانه',
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
                      const SizedBox(height: 40),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'سطحتو بشناس، '),
                            TextSpan(
                              text: 'بازی',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const TextSpan(text: ' کن، '),
                            TextSpan(
                              text: 'تخفیف',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const TextSpan(text: ' بگیر!'),
                          ],
                        ),
                        style: TextStyle(
                          color: AppColors.subTextQuizScreenColor,
                          fontSize: 22,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'با شرکت در چالش‌های روزانه به صورت بازی، امتیاز کسب کنید و مهارت‌های جدید یاد بگیرید. '
                          'با افزایش امتیاز، می‌توانید تخفیف بیشتری در دوره‌های آموزشی دریافت کنید. '
                          'هرچه امتیاز بالاتر، تخفیف بیشتر!',
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
                          title: 'شروع چالش',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DailyChallengeGamesScreen(),
                              ),
                            );
                          },
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BackQuiz(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
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
