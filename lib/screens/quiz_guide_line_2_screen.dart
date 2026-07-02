import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/quiz_landing_screen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizGuideLine2Screen extends StatelessWidget {
  const QuizGuideLine2Screen({super.key});

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
                              child: SvgPicture.asset(Assets.images.guidline2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 24),
                            child: Center(
                              child: Text(
                               'سطوح انگلیسی چیست ؟',
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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '''زبان انگلیسی دارای سطوح مختلفی می‌باشد که زبان‌آموز بر اساس آن از لحاظ دانش زبانی سنجیده می‌شود و برای یادگیری زبان انگلیسی بر اساس این سطوح دسته‌بندی می‌شود، هر سطح نشان‌دهنده میزان مهارت زبان‌آموز برای دریافت مدرک‌های بین‌المللی زبان است.''',
                            style: TextStyle(
                              color: AppColors.subTextQuizScreenColor,
                              fontSize: 16,
                              fontFamily: FontFamily.iranSansXRegular,
                              height: 2.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      SizedBox(height: 48),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: ButtonPrimary(title: 'بعدی', onPressed: () {}),
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
