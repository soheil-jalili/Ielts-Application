import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/quiz_guide_line_2_screen.dart';
import 'package:ielts/screens/quiz_landing_screen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizGuideLineScreen extends StatelessWidget {
  const QuizGuideLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
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
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: SvgPicture.asset(Assets.images.shapeQuiz),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: SvgPicture.asset(Assets.images.dictionary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 24),
                            child: Center(
                              child: Text(
                                'توضیحات آزمون',
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

                      const SizedBox(height: 56),

                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            '''این آزمون شامل ۳۰ سوال ۳ امتیازی می‌باشد و در مجموع ۹۰ امتیاز دارد:
در صورتی که به سوال پاسخ ندهید ۰ امتیاز،
در صورتی که به سوال پاسخ اشتباه دهید ۱- امتیاز،
و در صورتی که به سوال پاسخ درست دهید ۳ امتیاز دریافت خواهید کرد.''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.subTextQuizScreenColor,
                              fontSize: 16,
                              fontFamily: FontFamily.iranSansXRegular,
                              height: 2.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 48),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: ButtonPrimary(
                          title: 'بعدی',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuizGuideLine2Screen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => QuizLandingScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'بازگشت',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            HorizentalLine(bottomSpace: 18),
          ],
        ),
      ),
    );
  }
}
