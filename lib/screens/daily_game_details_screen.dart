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
      backgroundColor: AppColors.scaffoldColor2,

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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 35,
                      ),
                      child: TitleIcon(
                        title: 'توضیحات بازی',
                        fontFamily: FontFamily.iranSansXMedium,
                        fontSize: 14,
                        textColor: AppColors.titleIconTextColor,
                      ),
                    ),
                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        'این بازی دارای کاربری آسان و طراحی جذابی است که لذت انجام آن را دو چندان می‌سازد. صدایی که در طول بازی کلمات را بیان می‌کند، بسیار واضح بوده و به صورت شمرده کلمه را می‌خواند تا یادگیری آن برای شما سخت نباشد.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.iranSansXMedium,
                          color: AppColors.neutralTertiaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        'هر جمله در صورت وجود اشتباه، بلافاصله بررسی و تصحیح شده و همین ویژگی مهارت‌های شما را تقویت خواهد کرد. اگر به کلمه جدیدی برخوردید و دوست داشتید اطلاعات بیشتری در مورد آن پیدا کنید، تنها کافیست بر روی کلمه کلیک کرده و اطلاعات مورد نظر خود را مشاهده کنید. می‌توانید آمار کلمات و اشتباهات را بررسی کنید و به مرور زمان متوجه پیشرفت زبان انگلیسی خود خواهید شد.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.iranSansXMedium,
                          color: AppColors.neutralTertiaryColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 56),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FlexColumnWidth(0.85),
                          1: FlexColumnWidth(1.85),
                          2: FlexColumnWidth(0.85),
                          3: FlexColumnWidth(1.85),
                          4: FlexColumnWidth(0.85),
                          5: FlexColumnWidth(1.85),
                        },
                        border: TableBorder.all(
                          color: AppColors.secondary900Color,
                          width: 1,
                        ),
                        children: [
                          const TableRow(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 6,
                                  bottom: 6,
                                ),
                                child: Text(
                                  'سطح',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 6,
                                ),
                                child: Text(
                                  '200 امتیاز',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 6,
                                  bottom: 6,
                                ),
                                child: Text(
                                  'سطح',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 6,
                                ),
                                child: Text(
                                  '200 امتیاز',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 6,
                                  bottom: 6,
                                ),
                                child: Text(
                                  'سطح',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 6,
                                ),
                                child: Text(
                                  '200 امتیاز',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          const TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'A1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '10% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'B1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'C1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          const TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'A2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'B2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,

                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'C2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          const TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'A3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'B3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text(
                                  'C3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondary900Color,
                                    fontFamily:
                                        FontFamily.iranSansXRegularWithoutFaNum,
                                    fontSize: 15.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 11,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.iranSansXBold,
                                          color: AppColors.secondary900Color,
                                        ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Text(
                                          'تخفیف',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                FontFamily.iranSansXRegular,
                                            color: AppColors.secondary900Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

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
