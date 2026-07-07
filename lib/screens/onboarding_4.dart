import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/login_screen.dart';
import 'package:ielts/screens/main_screen.dart';
import 'package:ielts/screens/sign_up_screen.dart';
import 'package:ielts/widgets/button_outline_primar.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/horizental_line.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

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
                child: SvgPicture.asset(Assets.images.onboarding4),
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
                        padding: const EdgeInsets.symmetric(vertical: 64),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'سفرت را به سوی یادگیری '),
                              TextSpan(
                                text: 'آغاز',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' کن.'),
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
                          maxLines: 2,
                          TextSpan(
                            children: [
                              const TextSpan(text: 'همین حالا ثبت‌نام کن و '),
                              TextSpan(
                                text: 'اولین',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' قدم را به سوی '),
                              TextSpan(
                                text: 'یادگیری',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' زبان '),
                              TextSpan(
                                text: 'جدید',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              const TextSpan(text: ' بردار!'),
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonPrimary(
                            width: 111,
                            height: 45,
                            title: 'ثبت نام',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            fontSize: 18,
                          ),
                          SizedBox(width: 9),
                          ButtonOutlinePrimary(
                            strokeColor:
                                AppColors.activeBottomNavigationLabelColor,
                            width: 111,
                            height: 45,
                            title: 'ورود',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            fontSize: 18,
                            fillColor: Colors.white,
                          ),
                        ],
                      ),

                      SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'ورود به عنوان میهمان',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                            fontFamily: FontFamily.iranSansXMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      HorizentalLine(bottomSpace: 26, width: 200),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 20,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    Assets.images.backIcon,
                    width: 20,
                    height: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
