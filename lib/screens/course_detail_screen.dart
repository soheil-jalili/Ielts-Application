import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
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
                padding: const EdgeInsets.fromLTRB(40, 24, 40, 41),
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

              SliverToBoxAdapter(
                child: selectedIndex == 0
                    ? const Text('محتوای توضیحات دوره')
                    : selectedIndex == 1
                    ? const Text('محتوای جلسات دوره')
                    : const Text('محتوای نظرات کاربران'),
              ),
            ],
          ),
        ),
      ),
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
                    ? AppColors.courseDetailScreenSelectedTabTextColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
