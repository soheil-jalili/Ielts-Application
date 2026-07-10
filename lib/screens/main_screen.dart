import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/course_screen.dart';
import 'package:ielts/screens/home_screen.dart';
import 'package:ielts/screens/profile_screen.dart';
import 'package:ielts/screens/search_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => index = itemIndex),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(isActive ? activeIcon : icon, height: 24),
              const SizedBox(height: 6),
              Text(
                labels[itemIndex],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        extendBody: true,
        drawer: index == 3
            ? SafeArea(
                child: Drawer(
                  backgroundColor: Colors.white,
                  child: Column(
                    children: const [
                      ListTile(title: Text('پروفایل')),
                      ListTile(title: Text('فایل های اخیر')),
                      ListTile(title: Text('مورد علاقه ها')),
                      ListTile(title: Text('لیست ها')),
                      ListTile(title: Text('تنظیمات')),
                      ListTile(title: Text('خروج از حساب')),
                    ],
                  ),
                ),
              )
            : null,

        body: IndexedStack(
          index: index,
          children: [
            HomeScreen(),
            SearchScreen(),
            CourseScreen(),
            ProfileScreen(),
          ],
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
                    _item(0, Assets.images.home, Assets.images.homeActive),
                    _item(1, Assets.images.search, Assets.images.searchActive),
                    _item(2, Assets.images.video, Assets.images.videoActive),
                    _item(
                      3,
                      Assets.images.profile,
                      Assets.images.profileActive,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
