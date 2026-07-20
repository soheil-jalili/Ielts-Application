import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/star_container.dart';
import 'package:ielts/widgets/student_and_learn_language.dart';

class CafeMainScreen extends StatelessWidget {
  const CafeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor4,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 14, 20, 13),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(7, 8, 7, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.images.cafeBannerMain.image(
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              left: 7,
                              top: 7,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    Assets.images.cafeMainGermanFlag.path,
                                    fit: BoxFit.cover,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        Row(
                          children: [
                            Text(
                              'محمدرضا طهماسبی',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontFamily.iranSansXBold,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            StarContainer(width: 46, height: 22, rate: 4.7),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'استاد زبان های خارجه در دانشگاه صنعتی شریف، سابقه 4 سال تدریس',
                          style: TextStyle(
                            color: AppColors.tertiaryTextColor,
                            fontFamily: FontFamily.iranSansXRegular,
                            fontSize: 9,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              'مهارت ها: ',
                              style: TextStyle(
                                color: AppColors.tertiaryTextColor,
                                fontFamily: FontFamily.iranSansXRegular,
                                fontSize: 12,
                              ),
                            ),

                            Text(
                              'مکالمه، کسب و کار، آیلتس، تافل',

                              style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontFamily: FontFamily.iranSansXDemiBold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 37),
                        CafeMainButtons(
                          reserve: () {},
                          goToIntro: () {},
                          borderRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => Container(
                    padding: const EdgeInsets.only(bottom: 13),
                    margin: EdgeInsets.only(
                      left: 23,
                      right: 23,
                      bottom: index == 9 ? 121 : 11,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 16),
                          blurRadius: 32,
                          spreadRadius: -10,
                          color: AppColors.shadowBlack,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 28,
                          left: 11,
                          child: StarContainer(
                            width: 31,
                            height: 14,
                            rate: 4.7,
                            fontSize: 8,
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: StudentAndLanguageBox(
                                    index: index,
                                    leftSide: 8,
                                    rightSide: 6,
                                    width: 104,
                                    height: 104,
                                    flagHeightImage: 26,
                                    flagWidthImage: 26,
                                    widthImage: 100,
                                    heightImage: 100,
                                    leftPosition: -10,
                                    topPosition: -10,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 34),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'محمدرضا طهماسبی',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: FontFamily.iranSansXBold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'استاد زبان های خارجه دانشگاه صنعتی شریف',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColors.tertiaryTextColor,
                                          fontFamily:
                                              FontFamily.iranSansXRegular,
                                          fontSize: 9,
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Row(
                                        children: [
                                          Text(
                                            'مهارت ها: ',
                                            style: TextStyle(
                                              color:
                                                  AppColors.tertiaryTextColor,
                                              fontFamily:
                                                  FontFamily.iranSansXRegular,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'مکالمه، کسب و کار، آیلتس، تافل',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppColors.primaryTextColor,
                                              fontFamily:
                                                  FontFamily.iranSansXDemiBold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 17),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: CafeMainButtons(
                                reserve: () {},
                                goToIntro: () {},
                                borderRadius: 16,
                                reserveColorBackGroundColor:
                                    AppColors.primaryLight2Color,
                                textReserverColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class CafeMainButtons extends StatelessWidget {
  const CafeMainButtons({
    super.key,
    required this.reserve,
    required this.goToIntro,
    required this.borderRadius,
    this.height = 42,
    this.textReserverColor,
    this.reserveColorBackGroundColor,
  });

  final void Function() reserve;
  final void Function() goToIntro;
  final double borderRadius;
  final double height;
  final Color? reserveColorBackGroundColor;
  final Color? textReserverColor;

  @override
  Widget build(BuildContext context) {
    final fillColorReserverBtn =
        reserveColorBackGroundColor ?? AppColors.primaryLightColor;
    final textReserveColor =
        textReserverColor ?? AppColors.primaryLightWithoutAlphaColor;
    return Row(
      children: [
        Expanded(
          child: ButtonPrimary(
            title: 'رزرو کلاس',
            fontSize: 14,
            fontFamily: FontFamily.iranSansXDemiBold,
            fillColor: fillColorReserverBtn,
            borderRadius: borderRadius,
            haveShadow: false,
            textColor: textReserveColor,
            onPressed: reserve,
            height: height,
          ),
        ),
        SizedBox(width: 7),
        Expanded(
          child: ButtonPrimary(
            title: 'ویدیو معرفی',
            fontSize: 14,
            fillColor: AppColors.cafeBtnIntroColor,
            textColor: AppColors.black40Color,
            fontFamily: FontFamily.iranSansXDemiBold,
            borderRadius: borderRadius,
            haveShadow: false,
            onPressed: goToIntro,
            height: height,
          ),
        ),
      ],
    );
  }
}
