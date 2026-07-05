import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class BackQuiz extends StatelessWidget {
  const BackQuiz({super.key, this.title = 'بازگشت', required this.onTap});
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontFamily: FontFamily.iranSansXMedium,
        ),
      ),
    );
  }
}
