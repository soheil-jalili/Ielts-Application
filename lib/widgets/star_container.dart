import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';

class StarContainer extends StatelessWidget {
  const StarContainer({
    super.key,
    required this.width,
    required this.height,
    required this.rate,
    this.borderRadius = 10,
    this.fontSize = 10,
    this.widthSizedBox = 4,
  });

  final double width;
  final double height;
  final double borderRadius;
  final double rate;
  final double widthSizedBox;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors.primaryLightColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rate.toStringAsFixed(1),
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: FontFamily.gilroyMedium,
              color: AppColors.primaryLightWithoutAlphaColor,
            ),
          ),
          SizedBox(width: widthSizedBox),
          SvgPicture.asset(Assets.images.starCafe),
        ],
      ),
    );
  }
}
