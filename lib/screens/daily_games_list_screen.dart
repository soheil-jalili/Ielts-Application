import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_secondary.dart';
import 'package:ielts/widgets/title_and_back.dart';

class DailyGamesListScreen extends StatelessWidget {
  const DailyGamesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TitleAndBack(
                    title: 'بازی ها سطح A1',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              ),

              SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 16)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    _gameContainer(
                      nameOfGame: 'Adaptive Spelling Quiz',
                      level: 'مبتدی/متوسط',
                      onPressed: () {},
                    ),
                    Expanded(
                      child: SvgPicture.asset(Assets.images.dailyGames1),
                    ),
                  ],
                ),
              ),
              SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 16)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.images.dailyGames2),
                    SizedBox(width: 6),
                    _gameContainer(
                      nameOfGame: 'Human Brain Cloud',
                      level: 'مبتدی',
                      onPressed: () {},
                      shape: Assets.images.containerGames1ShapeFull,
                    ),
                  ],
                ),
              ),
              SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 16)),

              SliverToBoxAdapter(
                child: Row(
                  children: [
                    _gameContainer(
                      nameOfGame: '4 Pics 1 Word',
                      level: 'مبتدی',
                      onPressed: () {},
                      haveRightShape: true,
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset(Assets.images.dailyGames3),
                  ],
                ),
              ),
              SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 16)),

              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.images.dailyGames4),
                    SizedBox(width: 10),
                    _gameContainer(
                      nameOfGame: 'Human Brain Cloud',
                      level: 'مبتدی',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 124)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gameContainer({
    required String nameOfGame,
    required String level,
    required void Function() onPressed,
    bool haveRightShape = false,
    String? shape,
  }) {
    final String activeShape = shape ?? Assets.images.shapeContainer;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 201,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primary400Color,
      ),
      child: Stack(
        children: [
          haveRightShape
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    Assets.images.shapeContainerGames1Right,
                  ),
                )
              : Positioned(
                  bottom: 0,
                  left: 0,
                  child: SvgPicture.asset(activeShape),
                ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(Assets.images.controllerDailyGames1.path),
          ),

          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'بازی',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.iranSansXMedium,
                            color: AppColors.primary800Color,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          nameOfGame,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: FontFamily.gilroyMedium,
                            color: AppColors.primary800Color,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'سطح: $level',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: FontFamily.iranSansXMedium,
                            color: AppColors.primary800Color,
                          ),
                        ),
                        Spacer(),
                        ButtonSecondary(
                          title: 'شروع چالش',
                          onPressed: onPressed,
                          fontSize: 12,
                          fontFamily: FontFamily.iranSansXDemiBold,
                          width: 80,
                          height: 30,
                          textColor: AppColors.primary800Color,
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
