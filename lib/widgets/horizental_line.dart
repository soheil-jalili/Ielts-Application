import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';

class HorizentalLine extends StatelessWidget {
  const HorizentalLine({super.key, this.bottomSpace = 15.5, this.width = 180});

  final double bottomSpace;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpace),
      child: Container(
        width: width,
        height: 6,
        decoration: BoxDecoration(
          color: AppColors.loginScreenLineColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
