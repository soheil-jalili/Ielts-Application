import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/onboarding_3_screen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

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
                child: SvgPicture.asset(Assets.images.onboarding2),
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
                              const TextSpan(text: 'قدم به قدم به سوی '),
                              TextSpan(
                                text: 'تسلط',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          TextSpan(
                            children: [
                              const TextSpan(text: 'هر روز یک قدم به '),
                              TextSpan(
                                text: 'تسلط',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(
                                text:
                                    ' نزدیک‌تر شوید و از هر مکانی که هستید، به ',
                              ),
                              TextSpan(
                                text: 'راحتی',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' زبان جدیدی را بیاموزید.'),
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
                          title: 'بعدی',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Onboarding3Screen(),
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
                        widthFactor: 2 / 3,
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
