import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
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
    this.width,
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownChanged,
  });

  final String hintText;
  final double hintFontSize;
  final double? width;
  final bool isPassword;
  final bool isPhoneNumber;
  final TextEditingController controller;
  final Function(String)? onChanged;

  final bool isDropdown;
  final Map<String, String>? dropdownItems;
  final Function(String?)? onDropdownChanged;

  @override
  Widget build(BuildContext context) {
    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.strokeDownTextFieldColor,
        width: 0.5,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: hintFontSize,
        fontFamily: FontFamily.iranSansXRegular,
        color: AppColors.hintTextColor,
      ),
      enabledBorder: underlineBorder,
      focusedBorder: underlineBorder,
      suffixIcon: isPhoneNumber
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 0.5,
                  height: 56,
                  color:
                      AppColors.forgetPasswordTextFieldPhoneSeperatorLineColor,
                ),
                const SizedBox(width: 8),
                const Text(
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
    );

    return SizedBox(
      height: 56,
      width: width,
      child: isDropdown
          ? DropdownButtonFormField<String>(
              initialValue: controller.text.isEmpty ? null : controller.text,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.iranSansXRegular,
                fontSize: 18,
              ),
              icon: Transform.scale(
                scale: 0.4,
                child: SvgPicture.asset(Assets.images.downMakeAccount),
              ),
              decoration: inputDecoration,
              items: dropdownItems?.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  controller.text = newValue;
                  if (onDropdownChanged != null) {
                    onDropdownChanged!(newValue);
                  }
                }
              },
            )
          : TextField(
              obscureText: isPassword,
              keyboardType: isPhoneNumber ? TextInputType.phone : null,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.iranSansXRegular,
                fontSize: 20,
              ),
              onChanged: onChanged,
              controller: controller,
              decoration: inputDecoration,
            ),
    );
  }
}
