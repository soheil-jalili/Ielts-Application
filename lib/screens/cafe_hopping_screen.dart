import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/search_screen.dart';
import 'package:ielts/widgets/button_outline_primar.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/tab_view_custom.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CafeHoppingScreen extends StatefulWidget {
  const CafeHoppingScreen({super.key});

  @override
  State<CafeHoppingScreen> createState() => _CafeHoppingScreenState();
}

class _CafeHoppingScreenState extends State<CafeHoppingScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 18, 40, 19),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'کـافه گـردی',
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 14,
                            fontFamily: FontFamily.iranSansXBlack,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'گردشی در بهترین کافه‌های دنیا با تجربه‌ای متفاوت از طعم و فضا',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          SvgPicture.asset(Assets.images.cafeNotification),

                          Positioned(
                            right: 0,
                            top: 3,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.notificationContainerColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 9),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.images.cafeSearch),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              sliver: SliverToBoxAdapter(
                child: TabViewCustom(
                  selectedIndex: selectedIndex,
                  onTabChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  titles: ['دورهمی', 'همصحبت'],
                ),
              ),
            ),

            if (selectedIndex == 0) ...{
              Gatherings(),
            } else if (selectedIndex == 1) ...{
              CafeCompanion(),
            },
          ],
        ),
      ),
    );
  }
}

class CafeCompanion extends StatelessWidget {
  const CafeCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 24, bottom: 20),
            height: 35,
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showSortDialog(context: context);
                          },
                          child: SvgPicture.asset(
                            Assets.images.sort,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 6.6),
                        Container(
                          width: 1.1,
                          height: 22,
                          color: AppColors.verticalLineSearchScreenColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 3),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    reverse: true,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: index == 0
                            ? 40
                            : index == 2
                            ? 6
                            : 0,
                        right: 3,
                      ),
                      child: index == 2
                          ? ContainerWithText(
                              icon: Assets.images.plus,
                              isFillable: true,
                              fillColor: AppColors.black8Color,
                            )
                          : ContainerWithText(
                              title: 'English',
                              isFillable: true,
                              fillColor: AppColors.black8Color,
                              textColor: AppColors.black40Color,
                              onTap: () {},
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 4, (context, index) {
            return Container(
              clipBehavior: Clip.none,
              margin: EdgeInsets.only(
                bottom: index == 3 ? 148 : 9,
                right: 20,
                left: 20,
              ),
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 32,
                    spreadRadius: -10,
                    offset: Offset(0, 16),
                    color: AppColors.cafeContainerShadowColor,
                  ),
                ],
              ),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 15,
                            left: 12,
                            right: 8,
                          ),
                          width: 54,
                          height: 53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: AppColors.strokeProfileColor,
                            ),
                          ),
                          padding: const EdgeInsets.all(1),
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,

                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  Assets.images.avatarCafe.path,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: -3,
                                top: -3,
                                child: Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.avatarSquareColor,
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 26,
                                  bottom: 5,
                                ),
                                child: Text(
                                  'Shahrzad Ruhani',
                                  style: TextStyle(
                                    fontFamily: FontFamily.gilroySemiBold,
                                    fontSize: 14,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  LanguageAndProgress(
                                    language: 'EN',
                                    widthFactor: 100,
                                    color: AppColors
                                        .containerForForgroundProgressEn,
                                  ),

                                  const SizedBox(width: 7),
                                  SvgPicture.asset(Assets.images.change),
                                  const SizedBox(width: 7),
                                  LanguageAndProgress(
                                    language: 'JP',
                                    widthFactor: 50,
                                    color: AppColors
                                        .containerForForgroundProgressJP,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Hi, I\'m Shahrzad Ruhani. I would like to improve my Japanese, I know basic greetings so far',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  fontSize: 10,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Egypt, Cairo',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: AppColors.tertiaryTextColor,
                                  fontFamily: FontFamily.dMSansRegular,
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
            );
          }),
        ),
      ],
    );
  }

  Future<dynamic> showSortDialog({required BuildContext context}) {
    String? selectedCapital;

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 280,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: StatefulBuilder(
                builder: (context, setDialogState) {
                  return CustomScrollView(
                    clipBehavior: Clip.hardEdge,
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text(
                                  "مرتب سازی برا اساس",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: FontFamily.iranSansXBold,
                                  ),
                                ),
                              ),

                              CustomCheckBox(
                                title: 'Tehran',
                                value: selectedCapital == 'Tehran',
                                onChanged: (value) {
                                  setDialogState(() {
                                    selectedCapital = value == true
                                        ? 'Tehran'
                                        : null;
                                  });
                                },
                              ),
                              CustomCheckBox(
                                title: 'Cairo',
                                value: selectedCapital == 'Cairo',
                                onChanged: (value) {
                                  setDialogState(() {
                                    selectedCapital = value == true
                                        ? 'Cairo'
                                        : null;
                                  });
                                },
                              ),
                              CustomCheckBox(
                                title: 'Paris',
                                value: selectedCapital == 'Paris',
                                onChanged: (value) {
                                  setDialogState(() {
                                    selectedCapital = value == true
                                        ? 'Paris'
                                        : null;
                                  });
                                },
                              ),

                              SizedBox(height: 12),
                              ButtonPrimary(
                                title: 'اعمال کردن تغییرات',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,

          fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return Colors.transparent;
          }),

          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return BorderSide(color: AppColors.primaryColor, width: 2);
            }
            return BorderSide(color: AppColors.primaryColor, width: 2);
          }),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 16,
            fontFamily: FontFamily.dMSansRegular,
          ),
        ),
      ],
    );
  }
}

class LanguageAndProgress extends StatelessWidget {
  const LanguageAndProgress({
    super.key,
    required this.language,
    required this.color,
    required this.widthFactor,
  });

  final String language;
  final double widthFactor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          language,
          style: TextStyle(
            fontFamily: FontFamily.gilroyMedium,
            fontSize: 10,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2),
        Container(
          width: 14,
          height: 2,
          decoration: BoxDecoration(
            color: AppColors.black20Color,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: (widthFactor / 100).clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryContainerCafe extends StatelessWidget {
  const CategoryContainerCafe({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: AppColors.cafeContainerStrokeCategoryColor,
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontFamily.iranSansXMedium,
                fontSize: 12,
                color: AppColors.primaryTextColor,
              ),
            ),
            SizedBox(width: 6),
            SvgPicture.asset(Assets.images.cafeDown),
          ],
        ),
      ),
    );
  }
}

class Gatherings extends StatelessWidget {
  const Gatherings({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(40, 24, 40, 17),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryContainerCafe(
                  title: 'زبان',
                  onTap: () {
                    showDialogForCategory(
                      context: context,
                      title: 'زبان ها',
                      contents: ['انگلیسی', 'ایتالیایی', 'اسپانیایی'],
                    );
                  },
                ),
                SizedBox(width: 24),
                CategoryContainerCafe(
                  title: 'سطح',
                  onTap: () {
                    showDialogForCategory(
                      context: context,
                      title: 'سطح',
                      contents: ['مبتدی', 'متوسط', 'پیشرفته'],
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
            return Container(
              height: 183,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: AppColors.shadowBoxCoursesColor,
                  ),
                ],
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  radius: 2,
                  colors: index == 0
                      ? AppColors.cafeContainer1GradientColors
                      : index == 1
                      ? AppColors.cafeContainer2GradientColors
                      : AppColors.cafeContainer3GradientColors,
                ),
              ),
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: index == 2 ? 117 : 12,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(80, 255, 255, 255),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                'کافه ایتالیایی ها',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXBold,
                                  fontSize: 13,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            ),

                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 21),
                              child: Text(
                                'Beginner | Level 4',
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroySemiBold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Image.asset(
                                Assets.images.cafeItalyFlag.path,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
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

                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 33,
                              height: 33,
                              padding: EdgeInsets.all(1.2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.7,
                                  color: AppColors.strokeProfileColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                Assets.images.cafeRightProfile2.path,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              'کافه من:',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 8,
                                fontFamily: FontFamily.iranSansXRegular,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Alessandro',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontFamily.gilroyMedium,
                                fontSize: 12,
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
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          Assets.images.pic4.path,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 28,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          Assets.images.pic2.path,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 14,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          Assets.images.pic1.path,
                                        ),
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
                                            fontFamily:
                                                FontFamily.iranSansXBold,
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

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'موضوع دورهمی:',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: AppColors.secondaryTextColor,
                                        fontFamily: FontFamily.iranSansXRegular,
                                      ),
                                    ),
                                    SizedBox(width: 27),
                                    Text(
                                      'Movies',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: FontFamily.gilroyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'قوانین کافه:',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: AppColors.secondaryTextColor,
                                        fontFamily: FontFamily.iranSansXRegular,
                                      ),
                                    ),
                                    SizedBox(width: 31),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...[
                                          TitleList(title: 'تایپ آزاد'),
                                          TitleList(
                                            title: 'لورم اپیسوم متن ساختگی',
                                          ),
                                          TitleList(
                                            title:
                                                'لورم اپیسوم متن ساختگی با تولید سادگی',
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            ButtonOutlinePrimary(
                              title: 'ورود به کافه',
                              onPressed: () {},
                              strokeColor: AppColors.primaryBtnCafeScreenColor,
                              fillColor: Colors.transparent,
                              width: 120,
                              height: 40,
                              fontSize: 14,
                              borderRadius: 12,
                              fontFamily: FontFamily.iranSansXDemiBold,
                              textColor: AppColors.primaryBtnCafeScreenColor,
                            ),
                          ],
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
    );
  }

  Future<dynamic> showDialogForCategory({
    required BuildContext context,
    required String title,
    required List<String> contents,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 280,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomScrollView(
                clipBehavior: Clip.hardEdge,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: contents.length,
                      (context, index) {
                        final item = contents[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              item,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontFamily: FontFamily.iranSansXRegular,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TitleList extends StatelessWidget {
  const TitleList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.secondaryTextColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
            color: AppColors.secondaryTextColor,
            fontSize: 7,
            fontFamily: FontFamily.iranSansXRegular,
          ),
        ),
      ],
    );
  }
}
