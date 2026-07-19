import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';

class StudentAndLanguageBox extends StatelessWidget {
  const StudentAndLanguageBox({
    super.key,
    required this.index,
    this.width = 52,
    this.height = 52,
    this.imageSrc,
    this.widthImage = 48,
    this.heightImage = 48,
    this.leftSide = 8,
    this.rightSide = 10,
    this.flagWidthImage = 16,
    this.flagHeightImage = 16,

    this.leftPosition = -6,
    this.topPosition = -6,
  });

  final int index;

  final double width;
  final double height;

  final double widthImage;
  final double heightImage;

  final double leftSide;
  final double rightSide;

  final double flagWidthImage;
  final double flagHeightImage;

  final double leftPosition;
  final double topPosition;

  final String? imageSrc;

  @override
  Widget build(BuildContext context) {
    String imageSrcMain = imageSrc ?? Assets.images.mojAvatar.path;
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
      margin: EdgeInsets.only(right: rightSide, left: leftSide),
      padding: EdgeInsets.all(2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageSrcMain,
                width: widthImage,
                height: heightImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: leftPosition,
            top: topPosition,
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
