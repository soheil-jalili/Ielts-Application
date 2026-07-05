import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/custom_radio_result.dart';

class AnswerContainerResult extends StatelessWidget {
  const AnswerContainerResult({
    super.key,
    required this.title,
    required this.index,
    required this.correctAnswer,
    required this.currentSelected,
  });

  final String title;
  final int index;
  final int correctAnswer;
  final int currentSelected;

  @override
  Widget build(BuildContext context) {
    Color borderColor = AppColors.answerContainerQuizScreenColor;
    Widget leadingWidget;

    bool isUserSelected = index == currentSelected;
    bool isCorrectAnswer = index == correctAnswer;

    if (isUserSelected && isCorrectAnswer) {
      borderColor = AppColors.answerContainerCorrectAnswerQuizResultScreen;
      leadingWidget = const CustomRadioResult(isTrue: true);
    } else if (isUserSelected && !isCorrectAnswer) {
      borderColor = AppColors.answerContainerIncorrectAnswerQuizResultScreen;
      leadingWidget = const CustomRadioResult(isTrue: false);
    } else if (!isUserSelected && isCorrectAnswer) {
      borderColor = AppColors.answerContainerCorrectAnswerQuizResultScreen;
      leadingWidget = const CustomRadioResult(isTrue: true);
    } else {
      borderColor = AppColors.answerContainerQuizScreenColor;
      leadingWidget = Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: AppColors.radioButtonStrokeColor),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.fromLTRB(35, 0, 35, 24),
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1.5, color: borderColor),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: leadingWidget,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: FontFamily.iranSansXLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
