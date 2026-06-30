import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/course_screen.dart';
import 'package:ielts/screens/home_screen.dart';
import 'package:ielts/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  Widget _item(int itemIndex, String icon, String activeIcon) {
    final isActive = index == itemIndex;
    final labels = ['خانه', 'جستجو', 'دوره‌ها', 'پروفایل'];

    return GestureDetector(
      onTap: () => setState(() => index = itemIndex),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(isActive ? activeIcon : icon, height: 24),
          const SizedBox(height: 6),
          Text(
            labels[itemIndex],
            style: TextStyle(
              fontSize: 10,
              fontFamily: isActive
                  ? FontFamily.iranSansXDemiBold
                  : FontFamily.iranSansXMedium,
              color: isActive
                  ? AppColors.activeBottomNavigationLabelColor
                  : AppColors.deactiveBottomNavigationLabelColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: index == 3
          ? SafeArea(
              child: Drawer(
                backgroundColor: Colors.red,
                child: Column(children: const [ListTile(title: Text(''))]),
              ),
            )
          : null,

      body: IndexedStack(
        index: index,
        children: [HomeScreen(), SearchScreen(), CourseScreen()],
      ),

      bottomNavigationBar: SafeArea(
        bottom: false,
        child: Container(
          clipBehavior: Clip.none,
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16, left: 21, right: 21),
            height: 81,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 16),
                  blurRadius: 32,
                  spreadRadius: -10,
                  color: AppColors.bottomNavigationContainerColor,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _item(
                    0,
                    Assets.images.home.path,
                    Assets.images.homeActive.path,
                  ),
                  _item(
                    1,
                    Assets.images.search.path,
                    Assets.images.searchActive.path,
                  ),
                  _item(
                    2,
                    Assets.images.course.path,
                    Assets.images.courseActive.path,
                  ),
                  _item(
                    3,
                    Assets.images.profile.path,
                    Assets.images.profileActive.path,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
