import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/quiz_result_screen.dart';
import 'package:ielts/widgets/button_primary.dart';

void timeUpDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 0.8,
                color: AppColors.borderInsideTimeUpDialogColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 27, 20, 13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'زمان شما تمام شد !',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: FontFamily.iranSansXBold,
                      color: AppColors.primaryTimeUpDialogColor,
                    ),
                  ),
                  const SizedBox(height: 57),
                  ButtonPrimary(
                    title: 'مشاهده نتیجه',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuizResultScreen(),
                        ),
                      );
                    },
                    fillColor: AppColors.primaryTimeUpDialogColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
