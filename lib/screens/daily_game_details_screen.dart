import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/tab_view_custom.dart';
import 'package:ielts/widgets/title_and_back.dart';
import 'package:ielts/widgets/title_icon.dart';
import 'package:ielts/widgets/user_comment.dart';

class DailyGameDetailsScreen extends StatefulWidget {
  const DailyGameDetailsScreen({super.key});

  @override
  State<DailyGameDetailsScreen> createState() => _DailyGameDetailsScreenState();
}

class _DailyGameDetailsScreenState extends State<DailyGameDetailsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TitleAndBack(
                    title: 'بازی ها سطح A1',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.only(bottom: 24, right: 20, left: 20),
              sliver: SliverToBoxAdapter(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.primary400Color,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(Assets.images.shapeGameDetails),
                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset(
                          Assets.images.controllerGameDetails.path,
                        ),
                      ),

                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24, top: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'بازی',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: FontFamily.iranSansXBold,
                                  color: AppColors.primary800Color,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Adaptive Spelling Quiz',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: FontFamily.gilroyExtraBold,
                                  color: AppColors.primary800Color,
                                ),
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
                  titles: ['توضیحات بازی', 'نظرات کاربران'],
                ),
              ),
            ),

            if (selectedIndex == 0) ...{
              SliverPadding(
                padding: EdgeInsetsGeometry.only(right: 20, left: 20, top: 35),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      TitleIcon(
                        title: 'توضیحات بازی',
                        fontFamily: FontFamily.iranSansXMedium,
                        fontSize: 14,
                        textColor: AppColors.titleIconTextColor,
                      ),
                      SizedBox(height: 16),

                      Text(
                        'این بازی دارای کاربری آسان و طراحی جذابی است که لذت انجام آن را دو چندان می‌سازد. صدایی که در طول بازی کلمات را بیان می‌کند، بسیار واضح بوده و به صورت شمرده کلمه را می‌خواند تا یادگیری آن برای شما سخت نباشد.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.iranSansXMedium,
                          color: AppColors.neutralTertiaryColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'هر جمله در صورت وجود اشتباه، بلافاصله بررسی و تصحیح شده و همین ویژگی مهارت‌های شما را تقویت خواهد کرد. اگر به کلمه جدیدی برخوردید و دوست داشتید اطلاعات بیشتری در مورد آن پیدا کنید، تنها کافیست بر روی کلمه کلیک کرده و اطلاعات مورد نظر خود را مشاهده کنید. می‌توانید آمار کلمات و اشتباهات را بررسی کنید و به مرور زمان متوجه پیشرفت زبان انگلیسی خود خواهید شد.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.iranSansXMedium,
                          color: AppColors.neutralTertiaryColor,
                        ),
                      ),

                      SizedBox(height: 56),

  

                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 64, 55, 40),
                        child: ButtonPrimary(
                          title: 'شروع بازی',
                          onPressed: () {},
                          fontFamily: FontFamily.iranSansXBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            } else if (selectedIndex == 1) ...{
              SliverPadding(
                padding: EdgeInsetsGeometry.only(right: 20, left: 20, top: 35),
                sliver: UserComment(),
              ),
            },
          ],
        ),
      ),
    );
  }
}
