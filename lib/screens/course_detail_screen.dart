import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/extensions/string_extensions.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/button_secondary.dart';
import 'package:ielts/widgets/course_title.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(Assets.images.support),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: CourseTitle(title: 'آموزش گرامر با بازی'),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(Assets.images.courseDetailCover.path),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                sliver: SliverToBoxAdapter(
                  child: CourseDetailTabView(
                    selectedIndex: selectedIndex,
                    onTabChanged: (newIndex) {
                      setState(() {
                        selectedIndex = newIndex;
                      });
                    },
                  ),
                ),
              ),

              if (selectedIndex == 0)
                SliverPadding(
                  padding: const EdgeInsets.only(top: 40),
                  sliver: SliverToBoxAdapter(child: CourseDescription()),
                )
              else if (selectedIndex == 1)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 26),
                  sliver: const LockedCourseSessions(),
                )
              else
                const SliverToBoxAdapter(
                  child: Center(child: Text('محتوای نظرات کاربران')),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LockedCourseSessions extends StatelessWidget {
  const LockedCourseSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        height: 56,
        margin: EdgeInsets.only(bottom: index == 9 ? 124 : 12),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 16),
              blurRadius: 48,
              spreadRadius: -10,
              color: AppColors.shadowWhiteColor,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.images.lock),
            SizedBox(width: 16),
            Text(
              'درس اول',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.courseDetailScreenTextLockedSessionCourse,
                fontFamily: FontFamily.iranSansXMedium,
              ),
            ),
            Spacer(),
            SvgPicture.asset(Assets.images.playCourseDetail),
          ],
        ),
      ),
    );
  }
}

class CourseDescription extends StatelessWidget {
  const CourseDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(Assets.images.mojAvatar.path),
              ),

              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'مدرس دوره :',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        'میلاد دهیامی',
                        style: TextStyle(
                          color: AppColors.courseDetailScreenPrimaryColor,
                          fontSize: 16,
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.images.clock2),
                      SizedBox(width: 8),
                      Text(
                        '300 دقیقه',
                        style: TextStyle(
                          color: AppColors.courseDetailScreenSecondaryColor,
                          fontFamily: FontFamily.iranSansXMedium,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 22, bottom: 150),

            child: Column(
              children: [
                TitleIcon(
                  title: 'آموزش با ترفندهای خاص و الهام  از حرکات صورت و بدن',
                ),
                SizedBox(height: 15),
                TitleIcon(
                  title: 'انتقال آسان ساختارهای ترکیبی و پیچیده زبان انگلیسی',
                ),
                SizedBox(height: 15),
                TitleIcon(
                  title: 'آموزش گرامرهای انگلیسی بر اساس ساختارهای فارسی',
                ),

                SizedBox(height: 32),
                Text(
                  """خرید دوره فقط مخصوص یک‌کاربر و حداکثر قابل استفاده بر روی دو دستگاه (گوشی و لپتاپ) است.
بعد از خريد ويديوهای خود را به‌ صورت آنلاين با اینترنت نیم‌ بها تماشا كنيد.""",

                  style: TextStyle(
                    color: AppColors.courseDetailScreenSubTextColor,
                    fontFamily: FontFamily.iranSansXMedium,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        title: 'خرید دوره',
                        onPressed: () {},
                        borderRadius: 32,
                        height: 48,
                        fontFamily: FontFamily.iranSansXDemiBold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ButtonSecondary(
                        title: '800000'.formatWithCommas(),
                        isItPrice: true,
                        onPressed: () {},
                        height: 48,
                        borderRadius: 32,
                        fontFamily: FontFamily.iranSansXDemiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleIcon extends StatelessWidget {
  const TitleIcon({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconLeft(),

        SizedBox(width: 8),

        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.iranSansXMedium,
            color: AppColors.courseDetailScreenSubTextColor,
          ),
        ),
      ],
    );
  }
}

class IconLeft extends StatelessWidget {
  const IconLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 6, 11, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(56),
          bottomRight: Radius.circular(56),
        ),
        color: AppColors.primaryColor,
      ),
      child: SvgPicture.asset(Assets.images.leftCheveron, width: 7, height: 12),
    );
  }
}

class CourseDetailTabView extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CourseDetailTabView({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1.93),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.coruseDetailScreenTabViewColor,
      ),
      child: Row(
        children: [
          _buildTabItem(title: 'توضیحات دوره', index: 0),
          _buildTabItem(title: 'جلسات دوره', index: 1),
          _buildTabItem(title: 'نظرات کاربران', index: 2),
        ],
      ),
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.courseDetailScreenShadowTabColor,
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.iranSansXDemiBold,
                fontSize: 14,
                color: isSelected
                    ? AppColors.courseDetailScreenPrimaryColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
