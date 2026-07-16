import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/login_screen.dart';
import 'package:ielts/widgets/icon_left.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: IconLeft(),
                  ),
                  SizedBox(width: 7),
                  Column(
                    children: [
                      Text(
                        'نظرات',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXExtraBold,
                          color: AppColors.courseDetailScreenTextCommentColor,
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 3,
                        decoration: BoxDecoration(
                          color:
                              AppColors.courseDetailScreenBorderBottomTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 24 , horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.coruseDetailScreenContainerColor,
                ),
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'برای ثبت نظر خود ابتدا وارد ',
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXDemiBold,
                      ),
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'حساب کاربری ',
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXDemiBold,
                              color: AppColors.courseDetailScreenTextColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 74,
                          color:
                              AppColors.courseDetailScreenBorderBottomTextColor,
                          height: 1,
                        ),
                      ],
                    ),

                    Text(
                      'خود شوید.',
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXDemiBold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: index == 9 ? 124 : 16),
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8),
                  child: Row(
                    children: [
                      Image.asset(Assets.images.avatar.path),
                      SizedBox(width: 8),
                      Text(
                        'لیلا زارع',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXMedium,
                          fontSize: 12,
                          color: AppColors.courseDetailScreenSubTextColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: Text(
                    'حتی با این که دوره آفلاین بود، پشتیبانی بسیار عالی داشتند.👌',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 10,
                      color: AppColors.courseDetailScreenMessageColor,
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 1,
                  margin: EdgeInsets.fromLTRB(24, 17.5, 24, 4),
                  decoration: BoxDecoration(
                    color: AppColors.courseDetailScreenBorderBottomTextColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(Assets.images.adminAvatar.path),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'ادمین',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXMedium,
                          fontSize: 12,
                          color: AppColors.courseDetailScreenSubTextColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 68, top: 8),
                  child: Text(
                    'خداروشکر که از تدریس اساتید و پشتیبانی رضایت داشتید❤',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 10,
                      color: AppColors.courseDetailScreenMessageColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
