import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/extensions/string_extensions.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/models/skill_model.dart';
import 'package:ielts/widgets/title_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:collection/collection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Profile()),

            SliverToBoxAdapter(child: TitleHomeScreen()),

            SliverToBoxAdapter(
              child: CourseBoxesAndIndicator(pageController: pageController),
            ),

            SliverToBoxAdapter(child: HomeBanner()),
            SliverToBoxAdapter(child: FreeCourse()),

            SliverToBoxAdapter(
              child: TitlePage(title: 'انتخاب', titleColor: 'مهارت'),
            ),

            SliverToBoxAdapter(child: Skills()),

            SliverToBoxAdapter(child: Courses()),

            SliverToBoxAdapter(child: CafeSection()),

            SliverToBoxAdapter(
              child: TitlePage(title: 'آموزش های', titleColor: 'ویدیویی'),
            ),

            SliverToBoxAdapter(child: VideoCourse()),

            SliverToBoxAdapter(
              child: TitlePage(title: 'برترین های', titleColor: 'ماه'),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: TopOfTheMonth(),
            ),

            SliverPadding(padding: EdgeInsets.only(bottom: 90)),
          ],
        ),
      ),
    );
  }
}

class TopOfTheMonth extends StatelessWidget {
  const TopOfTheMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 2,
        (context, index) => TopOfTheMonthBox(index: index),
      ),
    );
  }
}

class TopOfTheMonthBox extends StatelessWidget {
  const TopOfTheMonthBox({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: index == 1 ? 24 : 8, right: 21, left: 19),
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 32,
            spreadRadius: -10,
            color: AppColors.shadowTopOfMonthColor,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 1,
                color: AppColors.borderAvatarTopOfMonthColor,
              ),
            ),
            margin: EdgeInsets.only(right: 10, left: 8),
            padding: EdgeInsets.all(2),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.images.mojAvatar.path,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: -6,
                  top: -6,
                  child: Image.asset(Assets.images.germanFlag.path),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مجتبی یزدان پناه',
                style: TextStyle(
                  fontFamily: FontFamily.iranSansXDemiBold,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'سطح C2',
                      style: TextStyle(
                        color: AppColors.tertiaryTextColor,
                        fontSize: 8,
                        fontFamily: FontFamily.iranSansXMedium,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      'تراز 52',
                      style: TextStyle(
                        color: AppColors.tertiaryTextColor,
                        fontSize: 8,
                        fontFamily: FontFamily.iranSansXMedium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 6,
                    ),
                  ),
                  ...['گرامر', 'مکالمه', 'شنیداری'].mapIndexed(
                    (index, e) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            e,
                            style: TextStyle(
                              color: AppColors.tertiaryTextColor,
                              fontSize: 8,
                              fontFamily: FontFamily.iranSansXMedium,
                            ),
                          ),
                        ),
                        if (index < 2) ...{
                          SizedBox(
                            height: 16,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 6,
                            ),
                          ),
                        },
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '15200'.formatWithCommas(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontFamily: FontFamily.iranSansXRegular,
                      ),
                    ),
                    SizedBox(width: 5),
                    Image.asset(Assets.images.cup.path, width: 15, height: 15),
                  ],
                ),
                SizedBox(height: 8),

                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.topArrowBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Assets.images.topArrow.path),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseBoxesAndIndicator extends StatelessWidget {
  const CourseBoxesAndIndicator({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: 354,
          height: 384,
          child: PageView.builder(
            controller: pageController,
            padEnds: false,
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: CourseBox(),
            ),
          ),
        ),
        SizedBox(height: 16),
        SmoothPageIndicator(
          controller: pageController, // PageController
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.dotActiveColor,
            dotWidth: 6,
            dotHeight: 6,
            spacing: 4,
            dotColor: AppColors.dotColor,
            expansionFactor: 4,
          ), // your preferred effect
        ),
      ],
    );
  }
}

class VideoCourse extends StatelessWidget {
  VideoCourse({super.key});
  final skills = ['مکالمه', 'گرامر', 'گرامر'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 11, bottom: 24.17),
      height: 204.83,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(
            right: index == 0 ? 16 : 0,
            left: index == 2 ? 16 : 8.3,
          ),

          width: 307.7,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.asset(Assets.images.videoImage.path),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff040415).withValues(alpha: 0.2),
                        Color(0xff040415).withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 9,
                  left: 8,
                  child: Container(
                    width: 65,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.videoCourseTimeLineBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '12:45',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXBold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 11.94,
                  right: 11.79,
                  left: 13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'زمان گذشته استمراری',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXBold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'سطح: مبتدی',
                            style: TextStyle(
                              color: AppColors.videoCourseLevel,
                              fontFamily: FontFamily.iranSansXMedium,
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '4.3K',
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXBold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            'بازید',
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXMedium,
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => index == 4
                                  ? Image.asset(
                                      Assets.images.starColorless.path,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                        left: index == 0 ? 0 : 4,
                                      ),
                                      child: Image.asset(
                                        Assets.images.starFill.path,
                                      ),
                                    ),
                            ),
                            Spacer(),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List.generate(skills.length, (index) {
                                  final skillName = skills[index];

                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: index == skills.length - 1 ? 0 : 4,
                                    ),
                                    child: SkillBadge(skill: skillName),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CafeSection extends StatelessWidget {
  const CafeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 24),
      height: 137,
      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: index == 0 ? 22 : 0, left: 11),
          width: 255,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withValues(alpha: 0.06),
              ),
            ],
            gradient: RadialGradient(
              center: Alignment.bottomRight,
              radius: 1,
              colors: index == 1
                  ? AppColors.profileTwoColor
                  : AppColors.profileOneColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 11, 0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'کافه ایتالیایی ها',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXBold,
                            fontSize: 13,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Image.asset(
                              Assets.images.lamp.path,
                              width: 14,
                              height: 14,
                            ),
                            Text(
                              'اینجا میتونی با دوستای جدید آنلاین صحبت کنی',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXRegular,
                                fontSize: 8,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(1000),

                      child: Image.asset(
                        Assets.images.italy.path,
                        width: 33,
                        height: 33,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 27),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.7,
                          color: AppColors.strokeProfileColor,
                        ),
                      ),
                      child: Image.asset(
                        Assets.images.profile1.path,
                        width: 26,
                        height: 26,
                      ),
                    ),

                    SizedBox(width: 4),

                    Text(
                      'کافه من:',
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXRegular,
                        fontSize: 8,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 1),
                    Text(
                      'Alessandro',
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        fontSize: 8,
                        color: Colors.black,
                      ),
                    ),

                    Spacer(),
                    SizedBox(
                      height: 24,
                      width: 72,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Positioned(
                            right: 42,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(Assets.images.pic4.path),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 28,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(Assets.images.pic2.path),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(Assets.images.pic1.path),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                color: AppColors.fillProfileColor,
                              ),
                              child: Center(
                                child: Text(
                                  '+16',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontFamily: FontFamily.iranSansXBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 283,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Course(index: index),
      ),
    );
  }
}

class Course extends StatelessWidget {
  const Course({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      width: 250,
      margin: EdgeInsets.only(right: index == 0 ? 21 : 0, left: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBoxCoursesColor,
            offset: const Offset(0, 14),
            blurRadius: 42,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 64,

                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    Assets.images.coruseImage.path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(80),
                        Colors.black.withAlpha(140),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black,
                      ),
                      width: 45,
                      height: 26,

                      child: Row(
                        children: [
                          Image.asset(Assets.images.russia.path),
                          SizedBox(width: 6),
                          Text(
                            'A2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: FontFamily.iranSansXMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),
                    Container(
                      width: 75,
                      height: 26,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.strokeTeachContainerColor,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'تدریس به انگلیسی',
                          style: TextStyle(
                            color: AppColors.teachTextColor,
                            fontFamily: FontFamily.iranSansXRegular,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 11),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          width: 48,
                          height: 26,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white.withValues(alpha: 0.08),
                          ),

                          child: Row(
                            children: [
                              Image.asset(Assets.images.star.path),
                              SizedBox(width: 6),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXLight,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Text(
            'آموزش زبان روسی - سطح  A2',
            style: TextStyle(
              fontFamily: FontFamily.iranSansXDemiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(Assets.images.profileCard.path),
              ),
              SizedBox(width: 4.5),
              Text(
                'مدرس',
                style: TextStyle(
                  fontFamily: FontFamily.iranSansXRegular,
                  fontSize: 10,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'علی تقوی',
                style: TextStyle(
                  fontFamily: FontFamily.iranSansXExtraBlack,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(Assets.images.timeSquare.path),
                  SizedBox(width: 6),
                  Text(
                    '18',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'ساعت آموزش',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXRegular,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  Image.asset(Assets.images.play.path),
                  SizedBox(width: 6),
                  Text(
                    '18',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'جلسه آموزشی',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXRegular,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20.5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 78,
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      width: 1,
                      color: AppColors.strokeCourseBoxColor,
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '386',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: FontFamily.iranSansXExtraBlack,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'کاربر فعال',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: FontFamily.iranSansXRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'رایگان',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: FontFamily.iranSansXBold,
                    color: AppColors.freeTextCourseColor,
                  ),
                ),
              ],
            ),
          ),

          Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(234, 42),
              backgroundColor: AppColors.buttonBoxCoursesColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              'ثبت نام در دوره',
              style: TextStyle(
                fontFamily: FontFamily.iranSansXDemiBold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 54),
      height: 94,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: index == 0 ? 20 : 6),
          child: Skill(index: index, skill: skills[index]),
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  const Skill({super.key, required this.index, required this.skill});
  final int index;
  final SkillModel skill;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: AppColors.strokeSkillColor),
      ),
      child: Stack(
        alignment: skill.shapeAlignment,
        children: [
          if (skill.shapeAlignment == Alignment.bottomLeft) ...{
            Image.asset(Assets.images.leftShape.path),
          } else ...{
            Image.asset(Assets.images.rightShape.path),
          },
          Image.asset(skill.image),
          Align(
            alignment: skill.titleAlignment,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    skill.titleAlignment == Alignment.topLeft ? 8 : 0,
                  ),
                  bottomRight: Radius.circular(
                    skill.titleAlignment == Alignment.topLeft ? 8 : 0,
                  ),
                  topRight: Radius.circular(
                    skill.titleAlignment == Alignment.topRight ? 8 : 0,
                  ),
                  bottomLeft: Radius.circular(
                    skill.titleAlignment == Alignment.topRight ? 8 : 0,
                  ),
                ),
                color: AppColors.fillSkillBoxColor,
              ),
              width: 48,
              height: 18,
              child: Center(
                child: Text(
                  skill.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontFamily.iranSansXMedium,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FreeCourse extends StatelessWidget {
  const FreeCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 24),
      height: 156,
      decoration: BoxDecoration(
        color: AppColors.freeCourseBoxColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(width: 0.5, color: AppColors.freeCourseStrokColor),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(Assets.images.shapeFreeCourse.path),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(Assets.images.shapeFreeCourse2.path),
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => index == 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'دوره',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamily.iranSansXBold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'های',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamily.iranSansXBold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'رایگان',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamily.iranSansXBold,
                            color: AppColors.freeCourseTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : IntrinsicHeight(
                    child: Container(
                      width: 216,
                      margin: EdgeInsets.only(
                        top: 14,
                        bottom: 14,
                        left: index == 3 ? 20 : 7,
                      ),

                      padding: const EdgeInsets.only(right: 9, left: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 45,
                            color: AppColors.freeBoxShadow,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(9, 10, 0, 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'آموزش جامع',
                                    style: TextStyle(
                                      fontFamily: FontFamily.iranSansXMedium,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'مهارت های ',
                                          style: TextStyle(
                                            fontFamily:
                                                FontFamily.iranSansXDemiBold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'نوشتاری',
                                          style: TextStyle(
                                            fontFamily:
                                                FontFamily.iranSansXDemiBold,
                                            color: AppColors.freeBoxSkillColor,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 0.5,
                                        margin: const EdgeInsets.only(
                                          bottom: 3,
                                        ),
                                        color: AppColors.freeSkillLineColor,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        'Writing',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontFamily: FontFamily.gilroyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(1),
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.strokeProfileColor,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Image.asset(
                                          Assets.images.womanProfile.path,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'مدرس:',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontFamily:
                                                    FontFamily.iranSansXRegular,
                                              ),
                                            ),
                                            const TextSpan(text: ' '),
                                            TextSpan(
                                              text: 'نسترن محمدی',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontFamily:
                                                    FontFamily.iranSansXBold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(Assets.images.clock.path),
                                          const SizedBox(width: 2),
                                          Text(
                                            '06:20',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.iranSansXMedium,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      Row(
                                        children: [
                                          Image.asset(Assets.images.paper.path),
                                          const SizedBox(width: 2),
                                          Text(
                                            '12 جلسه',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.iranSansXMedium,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 65,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          AppColors.freeCourseButtonFillColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'سطح مقدماتی',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontFamily:
                                              FontFamily.iranSansXDemiBold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: SizedBox(
                              width: 95,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      Assets.images.freeCourseShape3.path,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.images.keyboard.path,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141.11,
      margin: EdgeInsets.fromLTRB(20, 35, 20, 24.89),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.6),
        color: AppColors.bannerHomeColor,
        border: Border(
          left: BorderSide(width: 0.49, color: AppColors.borderBannerColor),
          bottom: BorderSide(width: 0.49, color: AppColors.borderBannerColor),
        ),
      ),
      child: Stack(
        children: [
          Positioned(left: 0, child: Image.asset(Assets.images.circle.path)),
          Row(
            children: [
              Image.asset(Assets.images.treeOfWord.path),
              Padding(
                padding: const EdgeInsets.only(top: 15.68),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "با خیال راحت ",
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXBlack,
                              fontSize: 15.68,
                            ),
                          ),
                          TextSpan(
                            text: "مهاجرت ",
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXBlack,
                              fontSize: 15.68,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "کن !",
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXBlack,
                              fontSize: 15.68,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7.44),
                    Text(
                      'از مبتدی تا پیشرفته، ما با تو همراهیم !',
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXRegular,
                        fontSize: 8.82,
                      ),
                    ),
                    SizedBox(height: 27.88),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 43.65),
                        width: 86,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.elevatedButtonBackgroundColor,
                          border: Border(
                            left: BorderSide(
                              width: 0.98,
                              color: AppColors.borderButtomColor,
                            ),
                            bottom: BorderSide(
                              width: 0.98,
                              color: AppColors.borderButtomColor,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(15.68),
                        ),

                        child: Center(
                          child: Text(
                            'تعیین سطح',
                            style: TextStyle(
                              fontSize: 11.76,
                              color: Colors.white,
                              fontFamily: FontFamily.iranSansXMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(Assets.images.travel.path),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseBox extends StatelessWidget {
  const CourseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.courseBoxColor,
      ),

      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: Image.asset(Assets.images.blur.path),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Text(
                              'دوره: ',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXRegular,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'آموزش گرامر اسپانیایی',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXBlack,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Text(
                          'سطح B1 | تراز 4 | گرامر | مکالمه',

                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 12,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Image.asset(Assets.images.lamp.path),
                            SizedBox(width: 5),
                            Text(
                              'کامل کردن این دوره، مهارت شما را در گرامر افزایش می دهد',

                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXDemiBold,
                                fontSize: 8,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 78,
                    height: 78,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Image.asset(
                      Assets.images.spainFlag.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '25',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXBold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  'درس از',
                                  style: TextStyle(
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                ),
                              ),
                              Text(
                                '60',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXBold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4),

                          Container(
                            width: double.infinity,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.white),
                              color: AppColors.progressBackgroundColor,
                            ),
                            alignment: Alignment.centerRight,
                            child: FractionallySizedBox(
                              // widthFactor: 1.0, // 100
                              // widthFactor: 0.25, // 25
                              widthFactor: 0.60,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.progressForgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 5),

                    Image.asset(Assets.images.cup2.path),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 17, top: 25, bottom: 23),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0.7,
                          color: AppColors.strokeProfileColor,
                        ),
                      ),
                      child: Image.asset(Assets.images.womanProfile.path),
                    ),

                    SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "مدرس: ",
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXRegular,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: "نسیم موسوی",
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXBlack,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'استاد زبان های خارجه دانشگاه صنعتی شریف',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXRegular,
                            color: AppColors.secondaryTextColor,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Spacer(),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(colors: AppColors.courseBoxColors),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'زمان کلاس بعدی:',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: FontFamily.iranSansXRegular,
                          color: AppColors.textCourseBoxColor,
                        ),
                      ),
                      SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "پنجشنبه ,",
                                  style: TextStyle(
                                    fontFamily: FontFamily.iranSansXRegular,
                                    fontSize: 13,
                                    color: AppColors.dateCourseBoxColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " 1403/06/15",
                                  style: TextStyle(
                                    fontFamily: FontFamily.iranSansXBold,
                                    fontSize: 13,
                                    color: AppColors.dateCourseBoxColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '20:30 - 22.00',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXRegular,
                                  fontSize: 13,
                                  color: AppColors.timeColor,
                                ),
                              ),
                              SizedBox(width: 4.32),
                              Image.asset(Assets.images.time.path),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleHomeScreen extends StatelessWidget {
  const TitleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 29.0, bottom: 13.0),
      child: Text(
        'دوره های در حال گذر...',
        style: TextStyle(
          fontFamily: FontFamily.iranSansXBlack,
          fontSize: 14,
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 27, 38),
      child: Row(
        children: [
          Container(
            width: 53,
            height: 53,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.strokeProfileColor,
                width: 0.7,
              ),
            ),
            child: Image.asset(Assets.images.hiroHamada1.path),
          ),

          SizedBox(width: 6),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سلام بهنام',
                style: TextStyle(
                  fontFamily: FontFamily.iranSansXDemiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    'به دنیای زبان خوش آمدی',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXRegular,
                      fontSize: 8,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(width: 2),
                  Image.asset(Assets.images.laugh.path),
                ],
              ),
            ],
          ),

          Spacer(),

          Container(
            width: 79,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 6),
                  child: Text(
                    '2135',
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXRegular,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.greenDarkerColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(
                      Assets.images.cup.path,
                      width: 16,
                      height: 16,
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

class SkillBadge extends StatelessWidget {
  const SkillBadge({super.key, required this.skill});

  final String skill;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.skillBadgeBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Text(
          skill,
          style: TextStyle(
            fontFamily: FontFamily.iranSansXDemiBold,
            fontSize: 9,
            color: AppColors.skillBadgeTextColor,
          ),
        ),
      ),
    );
  }
}
