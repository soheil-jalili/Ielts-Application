import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 16,
    this.height = 48,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.buttonTextColorOutlineColor,
    this.fontFamily = FontFamily.iranSansXRegular,
    this.isItPrice = false,
  });

  final String title;
  final String fontFamily;
  final double height;
  final void Function() onPressed;

  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final bool isItPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.loginScreenLineColor.withValues(
            alpha: 0.2,
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isItPrice
            ? Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: fontFamily,
                      color: textColor,
                    ),
                  ),

                  SizedBox(width: 4),

                  Text(
                    'تومان',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontFamily,
                      color: textColor,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
