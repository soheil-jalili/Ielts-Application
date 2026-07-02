import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizLandingScreen extends StatelessWidget {
  const QuizLandingScreen({super.key});

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
                              child: SvgPicture.asset(
                                Assets.images.onlineTestQuiz,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 24),
                            child: Center(
                              child: Text(
                                'آزمون تعیین سطح',
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
                      const SizedBox(height: 32),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'نمیدونی از کجا باید '),
                            TextSpan(
                              text: 'شروع',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                            const TextSpan(text: ' کنی؟'),
                          ],
                        ),
                        style: TextStyle(
                          color: AppColors.subTextQuizScreenColor,
                          fontSize: 26,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'اینجا میتونی سطح خودتو بسنجی!',
                        style: TextStyle(
                          color: AppColors.subTextQuizScreenColor,
                          fontSize: 20,
                          fontFamily: FontFamily.iranSansXDemiBold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '''ما در این اپلیکیشن برای شما امکانی را فراهم 
کرده ایم تا شما با یک آزمون تعیین سطح  مهارت
زبان خود را سنجش کنید و با توجه به آن آموزش 
خود را شروع کنید .''',
                        style: TextStyle(
                          color: AppColors.subTextQuizScreenColor,
                          fontSize: 16,
                          fontFamily: FontFamily.iranSansXRegular,
                          height: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        key: const ValueKey('btn_primary'),
                        child: ButtonPrimary(
                          title: 'بزن بریم',
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'بازگشت',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
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
