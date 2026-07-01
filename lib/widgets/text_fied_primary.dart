import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class TextFieldPrimary extends StatelessWidget {
  const TextFieldPrimary({
    super.key,
    required this.hintText,
    required this.controller,
     this.hintFontSize = 20,
    this.onChanged,
    this.isPassword = false,
    this.isPhoneNumber = false,
  });

  final String hintText;
  final double hintFontSize;
  final bool isPassword;
  final bool isPhoneNumber;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        obscureText: isPassword,
        keyboardType: isPhoneNumber ? TextInputType.phone : null,
        style: TextStyle(
          color: Colors.black,
          fontFamily: FontFamily.iranSansXRegular,
          fontSize: 20,
        ),
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: TextStyle(
            fontSize: hintFontSize,
            fontFamily: FontFamily.iranSansXRegular,
            color: AppColors.hintTextColor,
          ),

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.strokeDownTextFieldColor,
              width: 0.5,
            ),
          ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.strokeDownTextFieldColor,
              width: 0.5,
            ),
          ),

          suffixIcon: isPhoneNumber
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 0.5,
                      height: 56,
                      color: AppColors
                          .forgetPasswordTextFieldPhoneSeperatorLineColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+98',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: FontFamily.iranSansXLight,
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
