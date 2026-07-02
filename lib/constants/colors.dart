import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color scaffoldColor = const Color(0xffFCFCFC).withValues(alpha: 0.98);
  static Color scaffoldColor2 = const Color(0xffF6F6F9);

  static const Color primaryColor = Color(0xffFFA31A);

  static final Color shadowWhiteColor = const Color(
    0xff7090B0,
  ).withValues(alpha: 0.2);

  static const Color strokeProfileColor = Color.fromRGBO(0, 0, 0, 0.30);

  static final Color fillProfileColor = const Color(0xfff7b662);

  static const Color primaryTextColor = Color.fromRGBO(0, 0, 0, 0.80);
  static const Color secondaryTextColor = Color.fromRGBO(0, 0, 0, 0.60);
  static const Color tertiaryTextColor = Color.fromRGBO(0, 0, 0, 0.50);
  static const Color quaternaryTextColor = Color.fromRGBO(0, 0, 0, 0.80);

  static const Color greenColor = Color(0xff37E353);
  static const Color greenDarkerColor = Color(0xff21BA3A);
  static const Color courseBoxColor = Color(0xffFFF6DE);
  static Color progressBackgroundColor = Color(0xffFF9900).withAlpha(20);
  static const Color progressForgroundColor = Color(0xffFCBF22);
  static const Color textCourseBoxColor = Color(0xff2C4364);
  static const Color dateCourseBoxColor = Color(0xff2C4364);
  static const Color timeColor = Color(0xff2C4364);

  static final Color shadowBoxColor = const Color(
    0xff161616,
  ).withValues(alpha: 0.04);

  static const Color bannerHomeColor = Color(0xffFFFBEA);
  static const Color elevatedButtonBackgroundColor = Color(0xffFFBD1B);
  static const Color borderButtomColor = Color(0xffFFA31A);
  static const Color borderBannerColor = Color(0xffFFD246);
  static const Color freeCourseBoxColor = Color(0xffFFBD1B);
  static const Color freeCourseStrokColor = Color(0xffE27D17);
  static const Color freeCourseTextColor = Color(0xff444444);

  static final Color freeBoxShadow = const Color(
    0xff7090B0,
  ).withValues(alpha: 0.12);

  static const Color freeBoxSkillColor = Color(0xffE27200);

  static final Color freeSkillLineColor = const Color(
    0xff0F0F0F,
  ).withValues(alpha: 0.24);

  static const Color freeCourseButtonFillColor = Color(0xffFF9900);

  static const Color titleIconCheveronLeftBackgroundColor = Color(0xffFF9900);
  static const Color titleSkillColor = Color(0xffFFA31A);
  static const Color titleButtonColor = Color(0xffFFA31A);

  // Choice Skill
  static const Color strokeSkillColor = Color(0xffFFA31A);
  static const Color fillSkillBoxColor = Color(0xffFFA31A);

  // courses
  static final Color shadowBoxCoursesColor = const Color(
    0xff7090B0,
  ).withValues(alpha: 0.20);
  static const Color buttonBoxCoursesColor = Color(0xffFF9900);
  static const Color freeTextCourseColor = Color(0xff2598F4);
  static const Color strokeCourseBoxColor = Color(0xff0B0B0F);
  static const Color strokeTeachContainerColor = Color(0xff84FFB9);
  static const Color teachTextColor = Color(0xff84FFB9);

  static final List<Color> courseGradientColors = [
    Colors.black.withValues(alpha: 0.16),
    Colors.black.withValues(alpha: 0.27),
  ];

  static const Color dotActiveColor = Color(0xffFF9900);

  static final Color dotColor = Colors.black.withValues(alpha: 0.08);

  static const List<Color> courseBoxColors = [
    Color(0xffFFE072),
    Color(0xffFEBE19),
  ];

  // Profile Gradient Color
  static final List<Color> profileOneColor = [
    const Color(0xffF5B544).withValues(alpha: 0.0),
    const Color(0xff2772F0).withValues(alpha: 0.24), // 60 -> 24 درصد
  ];
  static final List<Color> profileTwoColor = [
    const Color(0xff4B9F47).withValues(alpha: 0.0),
    const Color(0xffF5B544).withValues(alpha: 0.39), // 100 -> 39 درصد
  ];

  // Video Courses
  static Color videoCourseTimeLineBackground = Color(
    0xff171717,
  ).withValues(alpha: 0.8);
  static Color videoCourseLevel = Color(0xffDEDCDC).withValues(alpha: 0.6);
  static Color skillBadgeBackgroundColor = Color(
    0xffBBB8B8,
  ).withValues(alpha: 0.3);
  static Color skillBadgeTextColor = Color(0xffFFFFFF).withValues(alpha: 0.7);

  // Top of the Month
  static Color shadowTopOfMonthColor = Colors.black.withValues(alpha: 0.1);
  static Color borderAvatarTopOfMonthColor = Colors.black.withValues(
    alpha: 0.3,
  );
  static Color topArrowBackgroundColor = Color(0xffFAE4E6);

  // Login Screen
  static Color loginScreenLineColor = Color(0xff797E79).withValues(alpha: 0.8);
  static Color loginScreenPrimaryColor = Color(0xffFFA31A);
  static Color hintTextColor = Color(0xff6D6D6D).withValues(alpha: 50);
  static Color strokeDownTextFieldColor = Color(
    0xff6D6D6D,
  ).withValues(alpha: 61);

  // Forget Password Screen
  static Color forgetPasswordPrimaryColor = Color(0xffFFA31A);
  static Color forgetPasswordTextFieldPhoneSeperatorLineColor = Color(
    0xff6D6D6D,
  ).withValues(alpha: 61);

  // Verification Code Screen
  static Color textFieldBorderBottomVerificationCodeScreenColor = Color(
    0xff6D6D6D,
  ).withValues(alpha: 61);

  // Button Colos
  static Color buttonBackgroundColor = Color(0xffFFA31A);
  static Color buttonShadowColor = Color(0xffFF9900).withValues(alpha: 0.2);
  static const Color buttonTextColorOutlineColor = Color(0xffFFA31A);

  // Course Detail Screen
  static Color coruseDetailScreenTabViewColor = Color(0xfffaf4e8);
  static Color coruseDetailScreenContainerColor = Color(0xfffaf4e8);
  static Color courseDetailScreenPrimaryColor = Color(0xffF15223);
  static Color courseDetailScreenSecondaryColor = Color(0xff8B8B8B);
  static Color courseDetailScreenSubTextColor = Color(0xff767676);
  static Color courseDetailScreenTextCommentColor = Color(0xff3F3F3F);
  static Color courseDetailScreenBorderBottomTextColor = Color(0xffF15223);
  static Color courseDetailScreenTextColor = Color(0xffF15223);
  static Color courseDetailScreenMessageColor = Color(0xff333333);
  static Color courseDetailScreenTextLockedSessionCourseColor = Color(
    0xff0F0F0F,
  ).withAlpha(80);
  static Color courseDetailScreenShadowTabColor = Color(
    0xff040415,
  ).withAlpha(10);

  // Search Screen
  static Color hintTextSearchScreenColor = Color(0xff3C3C43).withAlpha(60);
  static Color borderSearchScreenColor = Color(0xffCECECE);
  static Color verticalLineSearchScreenColor = Color(0xff979eae);
  static Color borderBottomSearchResultSearchScreenColor = Color(0xfff4f6f9);
  static Color fillStarSearchScreenColor = Color(0xffFAA224).withAlpha(20);
  static Color rateTextSearchScreenColor = Color(0xffFAA224);
  static Color activContainereSearchScreenColor = Color(
    0xffFFA31A,
  ).withAlpha(75);
  static Color fillContainereSearchScreenColor = Color(0xffF6F6F9);
  static Color searchResultTextSearchScreenColor = Color(0xff404040);
  static const Color containerLeftIconSearchScreenColor = Color.fromRGBO(
    0,
    0,
    0,
    0.60,
  );
  static const Color horizentalLineSearchScreenColor = Color.fromRGBO(
    0,
    0,
    0,
    0.30,
  );
  static Color popularSearchTextSearchScreenColor = Color(0xff404040);

  // Teacher Screen
  static Color strokeAvatarTeacherScreenColor = Color(0xff000000).withAlpha(30);
  static Color primaryTextTeacherScreenColor = Color(0xff787878);
  static Color secondaryTeacherScreenColor = Color(0xffFFA31A);
  static Color hintTextTeacherScreenColor = Color(0xff6D6D6D).withAlpha(50);
  static Color shadowContainerTeacherScreenColor = Color(
    0xff7090B0,
  ).withAlpha(20);

  // Quiz Screen
  static Color subTextQuizScreenColor = Color(0xff515151);


  // Shimmer
  static Color baseColorShimmer = Color(0xFFEDEDED);
  static Color highlightColorShimmer = Color(0xFFF5F5F5);

  // Bottom Navigation
  static const Color activeBottomNavigationLabelColor = Color(0xffFFA31A);
  static const Color deactiveBottomNavigationLabelColor = Color(0xff141313);
  static final Color bottomNavigationContainerColor = const Color(
    0xff7090B0,
  ).withValues(alpha: 0.2);
}
