import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';

class CustomRadioResult extends StatelessWidget {
  final bool isTrue;

  const CustomRadioResult({super.key, required this.isTrue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: isTrue
            ? AppColors.answerContainerCorrectAnswerQuizResultScreen
            : AppColors.answerContainerIncorrectAnswerQuizResultScreen,
      ),
      child: Icon(
        isTrue ? Icons.check : Icons.close,
        size: 14,
        color: Colors.white,
      ),
    );
  }
}
