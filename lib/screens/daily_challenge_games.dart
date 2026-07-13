import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/models/games_model.dart';
import 'package:ielts/widgets/button_secondary.dart';
import 'package:ielts/widgets/title_and_back.dart';

List<GamesModel> games = [
  GamesModel(
    title: 'بازی های سطح A1',
    level: 'a1',
    rating: 681,
    backgroundColor: AppColors.a1ContainerBackgroundColor,
    titleColor: AppColors.primaryABC1Color,
    buttonTextColor: AppColors.primaryABC1Color,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
  GamesModel(
    title: 'بازی های سطح B1',
    level: 'b1',
    rating: 324,
    backgroundColor: AppColors.b1C1ContainerBackgroundColor,
    titleColor: AppColors.primaryABC1Color,
    buttonTextColor: AppColors.primaryABC1Color,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
  GamesModel(
    title: 'بازی های سطح C1',
    level: 'c1',
    rating: 560,
    backgroundColor: AppColors.c1ContainerBackgroundColor,
    titleColor: AppColors.primaryABC1Color,
    buttonTextColor: AppColors.primaryABC1Color,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
  GamesModel(
    title: 'بازی های سطح A2',
    level: 'a2',
    rating: 900,
    backgroundColor: AppColors.a2ContainerBackgroundColor,
    titleColor: Colors.white,
    buttonTextColor: AppColors.primaryABC2ButtonTextColor,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
  GamesModel(
    title: 'بازی های سطح B2',
    level: 'b2',
    rating: 890,
    backgroundColor: AppColors.b2ContainerBackgroundColor,
    titleColor: Colors.white,
    buttonTextColor: AppColors.primaryABC2ButtonTextColor,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
  GamesModel(
    title: 'بازی های سطح C2',
    level: 'c2',
    rating: 780,
    backgroundColor: AppColors.c2ContainerBackgroundColor,
    titleColor: Colors.white,
    buttonTextColor: AppColors.primaryABC2ButtonTextColor,
    users: [
      Assets.images.dailyProfile1.path,
      Assets.images.dailyProfile2.path,
      Assets.images.dailyProfile3.path,
    ],
  ),
];

class DailyChallengeGames extends StatelessWidget {
  const DailyChallengeGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TitleAndBack(
                    title: 'چالش های روزانه',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: FontFamily.iranSansXDemiBold,
                      color: AppColors.subTextDailyChallengeScreenColor,
                    ),
                    children: [
                      TextSpan(text: 'سطحتو بشناس، '),
                      TextSpan(
                        text: 'بازی',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(text: ' کن، '),
                      TextSpan(
                        text: 'تخفیف',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(text: ' بگیر!'),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 24),
                  child: Text(
                    'بازی‌های روزانه بر اساس سطح شما طراحی شده‌اند تا یادگیری موثرتری داشته باشید. ابتدا در آزمون تعیین سطح شرکت کنید، سپس بازی‌های مناسب خود را انتخاب کرده و با کسب امتیاز، از تخفیف‌های ویژه بهره‌مند شوید!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: FontFamily.iranSansXRegular,
                      color: AppColors.subTextDailyChallengeScreenColor,
                      letterSpacing: 0.14,
                      height: 1.71,
                    ),
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: games.length, (
                  context,
                  index,
                ) {
                  final game = games[index];
                  final isGroup1 = game.level.endsWith('1');

                  double bottomMargin = 16;
                  if (index == games.length - 1) {
                    bottomMargin = 124;
                  } else if (isGroup1 && games[index + 1].level.endsWith('2')) {
                    bottomMargin = 37;
                  }

                  return Container(
                    clipBehavior: Clip.hardEdge,
                    height: 180,
                    margin: EdgeInsets.only(bottom: bottomMargin),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: game.backgroundColor,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: SvgPicture.asset(
                            isGroup1
                                ? Assets.images.shapeA
                                : Assets.images.shapeC,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.asset(Assets.images.controller.path),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 48, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 38.56,
                                    width: (game.users.length * 18.56) + 16.0,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: game.users.asMap().entries.map((
                                        entry,
                                      ) {
                                        return Positioned(
                                          left: entry.key * 18.56,
                                          child: Container(
                                            padding: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    AppColors.borderUserColor,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                entry.value,
                                                width: 34.56,
                                                height: 34.56,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'امتیاز کسب شده: ${game.rating}',
                                    style: TextStyle(
                                      color: game.titleColor,
                                      fontFamily: FontFamily.iranSansXMedium,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              Text(
                                game.title,
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXDemiBold,
                                  fontSize: 22,
                                  color: game.titleColor,
                                ),
                              ),
                              Spacer(),
                              ButtonSecondary(
                                title: 'شروع چالش',
                                onPressed: () {},
                                isItPrice: false,
                                height: 34,
                                width: 84,
                                fontFamily: FontFamily.iranSansXBold,
                                fontSize: 12,
                                textColor: game.buttonTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
