import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/back_icon.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/custom_radio.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.images.quizScreenTopShape,
              width: MediaQuery.of(context).size.width,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 17, 18, 10.98),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'زمان باقی مانده :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXDemiBold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '07:38',
                          style: TextStyle(
                            color: AppColors.timerTextQuizScreenColor,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXDemiBold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    BackIcon(),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(height: 100),
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
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 87, 24, 64),
                            child: Text(
                              "This is my friend.\n_______ name is Peter.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                height: 1.33,
                                fontFamily: FontFamily.iranSansXRegular,
                                color: Colors.black,
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ),

                        AnswerContainer(),
                        AnswerContainer(),
                        AnswerContainer(),
                        AnswerContainer(),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            right: 35,
                            bottom: 47,
                          ),
                          child: ButtonPrimary(title: 'بعدی', onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                ),

                HorizentalLine(bottomSpace: 18),
              ],
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 51.98,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircularPercentIndicator(
                    radius: 47.0,
                    lineWidth: 5.0,
                    percent: 18 / 30,
                    center: Text(
                      "13/30",
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXDemiBold,
                        fontSize: 20.0,
                        letterSpacing: 0.5,
                        color: AppColors.circleIndicatorPromary,
                      ),
                    ),
                    progressColor: AppColors.circleIndicatorPromary,
                    backgroundColor: Colors.grey.shade200,
                    circularStrokeCap: CircularStrokeCap.round,
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

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(35, 0, 35, 24),
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: AppColors.answerContainerQuizScreenColor,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomRadioButton(isClicked: true),
            ),

            Text(
              'her',
              style: TextStyle(
                fontSize: 24,
                fontFamily: FontFamily.iranSansXLight,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
