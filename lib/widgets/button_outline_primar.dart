import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class ButtonOutlinePrimary extends StatelessWidget {
  const ButtonOutlinePrimary({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 16,
    this.height = 56,
    this.width = double.infinity,
    this.fontSize = 20,
    this.fontFamily = FontFamily.iranSansXRegular,
    this.fillColor,
    required this.strokeColor,
  });

  final String title;
  final String fontFamily;
  final void Function() onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final Color? fillColor;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,

          foregroundColor: AppColors.loginScreenLineColor.withValues(
            alpha: 0.2,
          ),
          backgroundColor: fillColor ?? AppColors.buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: strokeColor, width: 2),
          ),
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
