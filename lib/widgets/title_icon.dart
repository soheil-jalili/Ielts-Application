
import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/icon_left.dart';

class TitleIcon extends StatelessWidget {
  const TitleIcon({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconLeft(),

        SizedBox(width: 8),

        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.iranSansXMedium,
            color: AppColors.courseDetailScreenSubTextColor,
          ),
        ),
      ],
    );
  }
}
