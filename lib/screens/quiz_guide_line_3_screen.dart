import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/quiz_landing_screen.dart';
import 'package:ielts/screens/quiz_screen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class QuizGuideLine3Screen extends StatelessWidget {
  const QuizGuideLine3Screen({super.key});

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
                              child: SvgPicture.asset(Assets.images.raising),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 24),
                            child: Center(
                              child: Text(
                                'من در چه سطحی ام ؟',
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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "بستگی به میزان امتیازی است که به‌دست می‌آورید، با توجه به جدول زیر سطح شما مشخص می‌شود.",
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

                      SizedBox(height: 24.53),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Table(
                          textDirection: TextDirection.rtl,
                          border: TableBorder.all(
                            color: AppColors.tablePrimaryQuizScreenColor,
                            width: 0.95,
                          ),

                          columnWidths: const {
                            0: FlexColumnWidth(1.1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(1.1),
                            3: FlexColumnWidth(2),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                _buildTableCell("سطح", isHeader: true),
                                _buildTableCell("مجموع امتیاز", isHeader: true),
                                _buildTableCell("سطح", isHeader: true),
                                _buildTableCell("مجموع امتیاز", isHeader: true),
                              ],
                            ),

                            TableRow(
                              children: [
                                _buildTableCell("A1"),
                                _buildTableCell("0 الی 15"),
                                _buildTableCell("A2"),
                                _buildTableCell("16 الی 30"),
                              ],
                            ),

                            TableRow(
                              children: [
                                _buildTableCell("B1"),
                                _buildTableCell("31 الی 45"),
                                _buildTableCell("B2"),
                                _buildTableCell("46 الی 60"),
                              ],
                            ),

                            TableRow(
                              children: [
                                _buildTableCell("C1"),
                                _buildTableCell("61 الی 75"),
                                _buildTableCell("C2"),
                                _buildTableCell("76 الی 90"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32.53),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: ButtonPrimary(
                          title: 'شروع آزمون',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(),
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

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: isHeader
          ? EdgeInsets.symmetric(vertical: 7)
          : EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.16,
          fontFamily: FontFamily.iranSansXRegular,
          color: AppColors.tablePrimaryQuizScreenColor,
        ),
      ),
    );
  }
}
