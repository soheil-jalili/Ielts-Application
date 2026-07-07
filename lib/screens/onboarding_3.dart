import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/onboarding_4.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(Assets.images.onboarding3),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 65),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'با زبان‌آموزی، '),
                              TextSpan(
                                text: 'آینده‌ات',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' را '),
                              TextSpan(
                                text: 'روشن‌تر',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' کن!'),
                            ],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontFamily.iranSansXBold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 84),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          TextSpan(
                            children: [
                              const TextSpan(text: 'همین '),
                              TextSpan(
                                text: 'امروز',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: '، سفرت به سوی '),
                              TextSpan(
                                text: 'یادگیری',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' را آغاز کن...'),
                            ],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontFamily.iranSansXMedium,
                              fontSize: 18,
                              height: 1.77,
                            ),
                          ),
                        ),
                      ),

                      Spacer(),
                      SizedBox(
                        width: 230,
                        child: ButtonPrimary(
                          title: 'شروع یادگیری',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Onboarding4(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 21),
                      HorizentalLine(bottomSpace: 26, width: 200),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'رد کردن',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 23),
                    Container(
                      width: 280,
                      height: 8,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.progressBarBackgroundColor,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 3 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(Assets.images.backIcon),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
