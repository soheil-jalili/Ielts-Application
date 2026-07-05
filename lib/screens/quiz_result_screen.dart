import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/answer_container_result.dart';
import 'package:ielts/widgets/back_quiz.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  int userChoice = 3;
  int correctChoice = 1;
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

            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 32),
              child: Text(
                'شما به این سوال پاسخ اشتباه داده اید .',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: FontFamily.iranSansXBold,
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
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 12,
                            child: Text(
                              '3/30',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXLight,
                                fontSize: 24,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    24,
                                    52,
                                    24,
                                    64,
                                  ),
                                  child: Text(
                                    "This is my friend.\n_______ name is Peter",
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

                              ...['her', 'our', 'yours', 'his'].mapIndexed(
                                (i, e) => AnswerContainerResult(
                                  title: e,
                                  correctAnswer: correctChoice,
                                  currentSelected: userChoice,
                                  index: i,
                                ),
                              ),

                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 35,
                                  right: 35,
                                  bottom: 24,
                                ),
                                child: ButtonPrimary(
                                  title: 'بعدی',
                                  onPressed: () {},
                                ),
                              ),

                              BackQuiz(
                                onTap: () {},
                                title: 'بازگشت به سوال قبلی',
                              ),
                              SizedBox(height: 24),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                HorizentalLine(bottomSpace: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
