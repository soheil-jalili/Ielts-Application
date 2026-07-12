import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/screens/course_screen.dart';
import 'package:ielts/screens/home_screen.dart';
import 'package:ielts/screens/profile_screen.dart';
import 'package:ielts/screens/search_screen.dart';
import 'package:ielts/widgets/profile_avatar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  bool showRecentFiles = false;
  bool showList = false;

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
        endDrawer: index == 3
            ? SafeArea(
                child: Drawer(
                  backgroundColor: AppColors.drawerBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.5, 47, 27, 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileAvatar(),
                            GestureDetector(
                              onTap: () =>
                                  scaffoldKey.currentState?.closeEndDrawer(),
                              behavior: HitTestBehavior
                                  .opaque, 
                              child: SvgPicture.asset(
                                Assets.images.leftCheveron,
                                colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 14),
                        child: Text(
                          'بهنام سمیعی',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 20,
                        indent: 20,
                        height: 2,
                        color: AppColors.primaryColor,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.images.profileDrawer),
                        title: Text(
                          'پروفایل',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () => setState(() {
                          if (showList) {
                            showList = false;
                          }

                          showRecentFiles = !showRecentFiles;
                        }),
                        leading: SvgPicture.asset(Assets.images.clockDrawer),
                        title: Row(
                          children: [
                            Text(
                              'فایل های اخیر',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXMedium,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 16),
                            SvgPicture.asset(showRecentFiles ? Assets.images.up : Assets.images.down),
                          ],
                        ),
                      ),

                      showRecentFiles
                          ? Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(right: 36),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'پادکست English Learning',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'چک لیست روزانه',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'کافه سطح A2 انگلیسی',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),

                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.images.heart),
                        title: Text(
                          'مورد علاقه ها',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () => setState(() {
                          if (showRecentFiles) {
                            showRecentFiles = false;
                          }
                          showList = !showList;
                        }),
                        leading: SvgPicture.asset(
                          Assets.images.horizentalLineCircle,
                        ),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'لیست ها',
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXMedium,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 16),
                           SvgPicture.asset(showList ? Assets.images.up : Assets.images.down),
                          ],
                        ),
                      ),

                      showList
                          ? Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(right: 36),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'دوره‌های زبان انگلیسی',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'چالش های روزانه',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'دوره‌های زبان ایتالیایی',
                                      style: TextStyle(
                                        fontFamily: FontFamily.iranSansXMedium,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),

                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.images.setting),
                        title: Text(
                          'تنظیمات',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                        },
                        leading: SvgPicture.asset(Assets.images.logout),
                        title: Text(
                          'خروج از حساب',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: AppColors.logoutTextDrawerColor,
                          ),
                        ),
                      ),

                      Spacer(),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.images.share),
                        title: Text(
                          'دعوت از دوستان',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(Assets.images.info),
                        title: Text(
                          'کمک و بازخورد',
                          style: TextStyle(
                            fontFamily: FontFamily.iranSansXMedium,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 24),
                        child: Center(
                          child: Text(
                            'version 3.1',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontFamily: FontFamily.gilroyRegular,
                            ),
                          ),
                        ),
                      ),
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
