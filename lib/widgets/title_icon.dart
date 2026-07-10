import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/icon_left.dart';

class TitleIcon extends StatelessWidget {
  const TitleIcon({
    super.key,
    required this.title,
    this.subText = '',
    this.fontSize = 12,
    this.fontFamily = FontFamily.iranSansXMedium,
    this.textColor = AppColors.courseDetailScreenSubTextColor,
  });
  final String title;

  final String subText;
  final String fontFamily;
  final Color textColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconLeft(),

        SizedBox(width: 8),

        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
        SizedBox(width: 2),
        Text(
          subText,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
