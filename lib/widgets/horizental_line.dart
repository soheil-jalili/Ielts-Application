import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';

class HorizentalLine extends StatelessWidget {
  const HorizentalLine({super.key, this.bottomSpace = 15.5});

  final double bottomSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpace),
      child: Container(
        width: 180,
        height: 6,
        decoration: BoxDecoration(
          color: AppColors.loginScreenLineColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
