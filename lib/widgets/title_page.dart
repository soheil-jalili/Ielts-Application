import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title, required this.titleColor});
  final String title;
  final String titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.titleIconCheveronLeftBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(56),
                bottomRight: Radius.circular(56),
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Image.asset(Assets.images.left.path),
          ),

          SizedBox(width: 8),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.iranSansXExtraBold,
                ),
              ),
              SizedBox(width: 3),
              Text(
                titleColor,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.iranSansXExtraBold,
                  color: AppColors.titleSkillColor,
                ),
              ),
            ],
          ),

          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 80,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.titleButtonColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'مشاهده همه',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: FontFamily.iranSansXMedium,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 6),
                  Image.asset(Assets.images.left2.path),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
