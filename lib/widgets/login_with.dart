import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({super.key, required this.image, required this.onTap});

  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 21, left: 25),
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: AppColors.loginScreenPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              'ادامه از طریق',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.loginScreenPrimaryColor,
                fontFamily: FontFamily.iranSansXMedium,
              ),
            ),

            SizedBox(width: 5),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}
