import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 16,
    this.height = 56,
    this.width = double.infinity,
    this.fontSize = 20,
    this.fontFamily = FontFamily.iranSansXRegular,
    this.fillColor,
    this.haveShadow = true,
    this.textColor = Colors.white,
  });

  final String title;
  final String fontFamily;
  final void Function() onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final Color? fillColor;
  final Color textColor;
  final bool haveShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: haveShadow
          ? BoxDecoration(
              boxShadow: [  
                BoxShadow(
                  offset: Offset(0, 16),
                  blurRadius: 32,
                  spreadRadius: -10,
                  color: AppColors.buttonShadowColor,
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.loginScreenLineColor.withValues(
            alpha: 0.2,
          ),
          backgroundColor: fillColor ?? AppColors.buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          maxLines: 1,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
