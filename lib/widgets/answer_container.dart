import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/custom_radio_button.dart';

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.fromLTRB(35, 0, 35, 24),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: isSelected
                  ? AppColors.answerContainerSelectedStrokeQuizScreenColor
                  : AppColors.answerContainerQuizScreenColor,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomRadioButton(isClicked: isSelected ? true : false),
              ),

              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: FontFamily.iranSansXLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
