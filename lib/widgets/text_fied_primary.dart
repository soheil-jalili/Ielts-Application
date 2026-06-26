import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class TextFieldPrimary extends StatelessWidget {
  const TextFieldPrimary({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.isPassword = false,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        obscureText: isPassword,
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
            fontSize: 20,
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
        ),
      ),
    );
  }
}
