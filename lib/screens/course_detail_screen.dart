import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/extensions/string_extensions.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/button_secondary.dart';
import 'package:ielts/widgets/tab_view_custom.dart';
import 'package:ielts/widgets/title_and_back.dart';
import 'package:ielts/widgets/title_icon.dart';
import 'package:ielts/widgets/user_comment.dart';
import 'package:better_player_plus/better_player_plus.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int selectedIndex = 0;
  bool courseParticipant = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor2,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(Assets.images.support),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TitleAndBack(title: 'آموزش گرامر با بازی'),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: selectedIndex == 1 && courseParticipant
                        ? VideoPlayer(
                            videoUrl: 'https://vjs.zencdn.net/v/oceans.mp4',
                          )
                        : Image.asset(Assets.images.courseDetailCover.path),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                sliver: SliverToBoxAdapter(
                  child: TabViewCustom(
                    selectedIndex: selectedIndex,
                    onTabChanged: (newIndex) {
                      setState(() {
                        selectedIndex = newIndex;
                      });
                    },
                    titles: ['توضیحات دوره', 'جلسات دوره', 'نظرات کاربران'],
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
                  sliver: selectedIndex == 1 && courseParticipant
                      ? UnLockedCourseSessions()
                      : LockedCourseSessions(),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.only(top: 32, left: 20, right: 20),
                  sliver: UserComment(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
          fit: BoxFit.fill,
          autoPlay: false,
          looping: false,
        );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(controller: _betterPlayerController);
  }
}

class LockedCourseSessions extends StatelessWidget {
  const LockedCourseSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Container(
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
                  color:
                      AppColors.courseDetailScreenTextLockedSessionCourseColor,
                  fontFamily: FontFamily.iranSansXMedium,
                ),
              ),
              Spacer(),
              SvgPicture.asset(Assets.images.playCourseDetail),
            ],
          ),
        ),
      ),
    );
  }
}

class UnLockedCourseSessions extends StatelessWidget {
  const UnLockedCourseSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Container(
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
              SvgPicture.asset(Assets.images.unlock),
              SizedBox(width: 16),
              Text(
                'درس اول',
                style: TextStyle(
                  fontSize: 18,
                  color:
                      AppColors.courseDetailScreenTextLockedSessionCourseColor,
                  fontFamily: FontFamily.iranSansXMedium,
                ),
              ),
              Spacer(),
              SvgPicture.asset(Assets.images.playUnlock),
            ],
          ),
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
