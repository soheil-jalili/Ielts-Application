import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';

void studyAnalyticsStatus(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.backgroundColorStudyAnalyticsStatusDialogBoxColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'بعد از ساخت پروفایل محاسبه‌ی مطالعه‌ی\nروزانه‌ی شما انجام خواهد شد.',
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 18,
                      letterSpacing: 0.18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 24),
                  child: ButtonPrimary(
                    title: 'ساخت پروفایل',
                    onPressed: () {},
                    width: 116,
                    height: 32,
                    fontSize: 10,
                    fontFamily: FontFamily.iranSansXMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
