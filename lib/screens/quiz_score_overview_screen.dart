import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/quiz_result_screen.dart';
import 'package:ielts/widgets/back_quiz.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizScoreOverviewScreen extends StatelessWidget {
  const QuizScoreOverviewScreen({super.key});

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
                              padding: const EdgeInsets.only(top: 90),
                              child: SvgPicture.asset(Assets.images.result),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Text(
                                'نتایج آزمون',
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
                      SizedBox(height: 55),

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'شما از این آزمون '),
                            TextSpan(
                              text: '73 امتیاز',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20.0,
                                fontFamily: FontFamily.iranSansXDemiBold,
                              ),
                            ),
                            TextSpan(text: ' دریافت کردید!'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: AppColors.subTextQuizScreenColor,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),

                      SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'این '),
                            TextSpan(
                              text: 'فوق‌العاده',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18.0,
                                fontFamily: FontFamily.iranSansXDemiBold,
                              ),
                            ),
                            TextSpan(text: ' است، شما در سطح '),
                            TextSpan(
                              text: 'C1',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18.0,
                                fontFamily: FontFamily.iranSansXDemiBold,
                              ),
                            ),
                            TextSpan(text: ' هستید!'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.subTextQuizScreenColor,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),

                      SizedBox(height: 24),

                      Text(
                        'شما به 25 سوال پاسخ صحیح داده اید\nبه 2 سوال پاسخ نادرست داده اید\nو به 3 سوال پاسخ نداده اید .',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 16.0,
                          height: 2.0,
                          fontFamily: FontFamily.iranSansXRegular,
                          color: AppColors.subTextQuizScreenColor,
                        ),
                      ),

                      SizedBox(height: 24),

                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          '25 * 3 + 2 * ( -1 ) - ( 3 * 3 ) = 73',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXRegular,
                            color: AppColors.subTextQuizScreenColor,
                          ),
                        ),
                      ),

                      SizedBox(height: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: ButtonPrimary(
                          title: 'مشاهده ریز نتایج',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => QuizResultScreen(),
                              ),
                            );
                          },
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
            HorizentalLine(bottomSpace: 18),
          ],
        ),
      ),
    );
  }
}
