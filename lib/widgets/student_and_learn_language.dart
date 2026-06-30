import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';

class StudentAndLanguageBox extends StatelessWidget {
  const StudentAndLanguageBox({
    super.key,
    required this.index,
    this.width = 52,
    this.height = 52,

    this.widthImage = 48,
    this.heightImage = 48,
    this.leftSide = 8,

    this.flagWidthImage = 16,
    this.flagHeightImage = 16,
  });
  final int index;

  final double width;
  final double height;

  final double widthImage;
  final double heightImage;

  final double leftSide;

  final double flagWidthImage;
  final double flagHeightImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: AppColors.borderAvatarTopOfMonthColor,
        ),
      ),
      margin: EdgeInsets.only(right: 10, left: leftSide),
      padding: EdgeInsets.all(2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.images.mojAvatar.path,
                width: widthImage,
                height: heightImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: -6,
            top: -6,
            child: Image.asset(
              Assets.images.germanFlag.path,
              width: flagWidthImage,
              height: flagHeightImage,
            ),
          ),
        ],
      ),
    );
  }
}
