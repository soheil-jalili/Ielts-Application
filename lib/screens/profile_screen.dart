import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/main_screen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/profile_avatar.dart';
import 'package:ielts/widgets/title_icon.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset(Assets.images.shapeProfile1),
                  ),
                  Positioned(
                    top: 0,
                    right: 89,
                    child: SvgPicture.asset(Assets.images.shapeProfile2),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 16,
                    child: SvgPicture.asset(Assets.images.shapeProfile3),
                  ),

                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const ProfileAvatar(
                                  width: 54,
                                  height: 54,
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                left: 0,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(Assets.images.pen),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'نام: بهنام سمیعی',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors
                                      .primaryTopTextProfileScreenColor,
                                  fontFamily: FontFamily.iranSansXDemiBold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'سن: 24',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors
                                      .primaryTopTextProfileScreenColor,
                                  fontFamily: FontFamily.iranSansXDemiBold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'همراه از: 15 فروردین 1403',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors
                                      .primaryTopTextProfileScreenColor,
                                  fontFamily: FontFamily.iranSansXDemiBold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: SvgPicture.asset(Assets.images.hamberMenu),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 16),
                padding: EdgeInsets.fromLTRB(20, 8, 24, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.achievementBoxShadowProfileScreenColor,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'دستاورد ها',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontFamily.iranSansXMedium,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'دستاورد های شما بر اساس پیشروی شما محاسبه میگردد',
                      style: TextStyle(
                        color: AppColors.primarySubTextProfileScreenColor,
                        fontFamily: FontFamily.iranSansXRegular,
                        fontSize: 8,
                      ),
                    ),

                    SizedBox(height: 13),

                    Row(
                      children: [
                        Text(
                          '20%',
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: FontFamily.iranSansXRegular,
                            color: AppColors.percentAchievementColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 140,
                          height: 4,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.progressBarBackgroundColor,
                          ),
                          child: FractionallySizedBox(
                            widthFactor: 20 / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),

                        Spacer(),

                        Image.asset(
                          Assets.images.cupColorless.path,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(width: 16),

                        Image.asset(
                          Assets.images.cupColorless.path,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(width: 16),

                        Image.asset(
                          Assets.images.cupColorless.path,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(width: 16),

                        Image.asset(
                          Assets.images.cupColorless.path,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(width: 16),
                        Image.asset(
                          Assets.images.cupFill.path,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
                height: 235,
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 20,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.achievementBoxShadowProfileScreenColor,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ساعت مطالعه روزانه',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: FontFamily.iranSansXMedium,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'محاسبه میانگین ساعت مطالعه در هفته شما',
                      style: TextStyle(
                        fontSize: 8,
                        fontFamily: FontFamily.iranSansXRegular,
                        color: AppColors.primarySubTextProfileScreenColor,
                      ),
                    ),
                    const SizedBox(height: 23),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Center(
                              child: Text(
                                'ســــاعـــــــت',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: AppColors
                                      .primarySubTextProfileScreenColor,
                                  fontFamily: FontFamily.iranSansXRegular,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: LineChart(
                              LineChartData(
                                minX: 0,
                                maxX: 5,
                                minY: -0.01,
                                maxY: 5.5,

                                lineTouchData: LineTouchData(
                                  getTouchedSpotIndicator:
                                      (
                                        LineChartBarData barData,
                                        List<int> spotIndexes,
                                      ) {
                                        return spotIndexes.map((spotIndex) {
                                          return TouchedSpotIndicatorData(
                                            FlLine(
                                              color: Colors.transparent,
                                              strokeWidth: 0,
                                            ),
                                            FlDotData(show: false),
                                          );
                                        }).toList();
                                      },
                                  touchTooltipData: LineTouchTooltipData(
                                    getTooltipColor: (LineBarSpot touchedSpot) {
                                      return AppColors
                                          .tooltipProfileScreenColor;
                                    },
                                    getTooltipItems:
                                        (List<LineBarSpot> touchedSpots) {
                                          return touchedSpots.map((
                                            LineBarSpot touchedSpot,
                                          ) {
                                            return LineTooltipItem(
                                              'میانگین مطالعه: 2:33',
                                              TextStyle(
                                                color: Colors.white,
                                                fontSize: 6,
                                                fontFamily:
                                                    FontFamily.iranSansXRegular,
                                              ),
                                            );
                                          }).toList();
                                        },
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 1,
                                  getDrawingHorizontalLine: (value) => FlLine(
                                    color:
                                        AppColors.chartGridProfileScreenColor,
                                    strokeWidth: 1,
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                titlesData: FlTitlesData(
                                  leftTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      reservedSize: 40,
                                      getTitlesWidget: (value, meta) {
                                        final int intValue = value.round();

                                        String? text;
                                        if (intValue == 0) {
                                          text = '0';
                                        } else if (intValue == 1) {
                                          text = '1';
                                        } else if (intValue == 2) {
                                          text = '1.5';
                                        } else if (intValue == 3) {
                                          text = '2';
                                        } else if (intValue == 4) {
                                          text = '2.5';
                                        } else if (intValue == 5) {
                                          text = '3';
                                        }

                                        if (text == null) {
                                          return const SizedBox.shrink();
                                        }

                                        return SideTitleWidget(
                                          meta: meta,
                                          space: 8,
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              color: AppColors
                                                  .chartTextProfileScreenColor,
                                              fontSize: 12,
                                              fontFamily:
                                                  FontFamily.iranSansXMedium,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      reservedSize: 30,
                                      getTitlesWidget: (value, meta) {
                                        const days = [
                                          'ج',
                                          'پ',
                                          'چ',
                                          'س',
                                          'د',
                                          'ی',
                                        ];
                                        final int index = value.round();

                                        if (index < 0 ||
                                            index >= days.length ||
                                            (value - index).abs() > 0.1) {
                                          return const SizedBox.shrink();
                                        }

                                        return SideTitleWidget(
                                          meta: meta,
                                          space: 6,
                                          child: Text(
                                            days[index],
                                            style: TextStyle(
                                              color: AppColors
                                                  .chartTextProfileScreenColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  FontFamily.iranSansXMedium,
                                              fontSize: 10,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0, 3),
                                      FlSpot(1, 1),
                                      FlSpot(2, 3),
                                      FlSpot(3, 5),
                                      FlSpot(4, 1),
                                      FlSpot(5, 4),
                                    ],
                                    isCurved: true,
                                    color: AppColors.primaryColor,
                                    barWidth: 1,
                                    isStrokeCapRound: true,
                                    dotData: const FlDotData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.achievementBoxShadowProfileScreenColor,
                    ),
                  ],
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleProgress(percent: 33),
                        SizedBox(height: 4),
                        Text(
                          'مطالعه امروز',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXMedium,
                            color: AppColors.percentTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleProgress(percent: 40),
                        SizedBox(height: 4),
                        Text(
                          'انجام تکلیف',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXMedium,
                            color: AppColors.percentTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleProgress(percent: 60),
                        SizedBox(height: 4),
                        Text(
                          'پیشرفت دوره‌ها',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXMedium,
                            color: AppColors.percentTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsetsGeometry.only(right: 20, bottom: 16),
              sliver: SliverToBoxAdapter(
                child: TitleIcon(
                  title: 'چالش',
                  subText: 'روزانه',
                  fontFamily: FontFamily.iranSansXExtraBold,
                  fontSize: 14,
                  textColor: Colors.black,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 147,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.bannerProfileScreenColor,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          Assets.images.banner1Profile.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 24, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: FontFamily.iranSansXMedium,
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: 'بازی کن، '),
                                TextSpan(
                                  text: 'امتیاز',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontFamily: FontFamily.iranSansXBold,
                                  ),
                                ),
                                const TextSpan(text: ' بگیر'),
                              ],
                            ),
                          ),
                          Text(
                            'بازی های روزانه برای یادگیری بهتر شما',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: FontFamily.iranSansXMedium,
                            ),
                          ),
                          ButtonPrimary(
                            title: 'مشاهده بیشتر',
                            onPressed: () {},
                            width: 120,
                            height: 34,
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXDemiBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsetsGeometry.only(right: 20, bottom: 16),
              sliver: SliverToBoxAdapter(
                child: TitleIcon(
                  title: 'چک لیست',
                  subText: 'روزانه',
                  fontFamily: FontFamily.iranSansXExtraBold,
                  fontSize: 14,
                  textColor: Colors.black,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 147,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.bannerProfileScreenColor,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          Assets.images.banner2Profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 24, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: FontFamily.iranSansXMedium,
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: 'تمرین کن، '),
                                TextSpan(
                                  text: 'امتیاز',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontFamily: FontFamily.iranSansXBold,
                                  ),
                                ),
                                const TextSpan(text: ' بگیر'),
                              ],
                            ),
                          ),
                          Text(
                            'چک لیست روزانه برای یادگیری بهتر شما',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: FontFamily.iranSansXMedium,
                            ),
                          ),
                          ButtonPrimary(
                            title: 'مشاهده بیشتر',
                            onPressed: () {},
                            width: 120,
                            height: 34,
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXDemiBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleProgress extends StatelessWidget {
  const CircleProgress({super.key, required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 96,
        height: 96,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: percent / 100,
                progressColor: AppColors.primaryColor.withValues(alpha: 0.6),
                backgroundColor: Colors.transparent,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 6.0,
              percent: percent / 100,
              center: Text(
                "$percent%",
                style: TextStyle(
                  fontFamily: FontFamily.iranSansXDemiBold,
                  fontSize: 18.0,
                  letterSpacing: 0.5,
                  color: AppColors.circleIndicatorPromary,
                ),
              ),
              progressColor: AppColors.primaryColor,
              backgroundColor: AppColors.backgroundPercentCircleColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
