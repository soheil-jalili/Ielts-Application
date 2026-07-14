import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_outline_primar.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/text_field_optional.dart';
import 'package:ielts/widgets/text_field_primary.dart';
import 'package:ielts/widgets/title_icon.dart';
import 'package:ielts/widgets/title_page.dart';

class MakeAccountScreen extends StatefulWidget {
  const MakeAccountScreen({super.key});

  @override
  State<MakeAccountScreen> createState() => _MakeAccountScreenState();
}

class _MakeAccountScreenState extends State<MakeAccountScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 140,
                color: AppColors.topBarMakeAccountContainerColor,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 113,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                if (_carouselController.ready) {
                                  _carouselController.previousPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOutCubic,
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(Assets.images.leftMake),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                if (_carouselController.ready) {
                                  _carouselController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOutCubic,
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(Assets.images.right),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          left: 40,
                          right: 40,
                          child: Center(
                            child: ValueListenableBuilder<int>(
                              valueListenable: _currentIndexNotifier,
                              builder: (context, currentIndex, _) {
                                return CarouselSlider.builder(
                                  carouselController: _carouselController,
                                  itemCount: 5,
                                  itemBuilder: (context, index, realIndex) {
                                    return _buildProfileAvatar(
                                      Assets.images.profileMake.path,
                                      index,
                                      currentIndex,
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 80,
                                    viewportFraction: 0.2,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.33,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      _currentIndexNotifier.value = index;
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 113,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 29, bottom: 32),
                        child: Row(
                          children: [
                            TitleIcon(
                              title: 'مشخصات کاربر',
                              fontFamily: FontFamily.iranSansXRegular,
                              fontSize: 16,
                              textColor: Colors.black,
                            ),

                            SizedBox(width: 8),

                            SvgPicture.asset(Assets.images.info),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: TextFieldPrimary(
                              hintText: 'نام',
                              controller: TextEditingController(),
                              hintFontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            child: TextFieldPrimary(
                              hintText: 'نام خانوادگی',
                              controller: TextEditingController(),
                              hintFontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldPrimary(
                              hintText: 'جنسیت',
                              controller: TextEditingController(),
                              isDropdown: true,
                              dropdownItems: const {
                                'male': 'مرد',
                                'female': 'زن',
                              },
                              onDropdownChanged: (selectedValue) {},
                              hintFontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            child: TextFieldPrimary(
                              hintText: 'سن',
                              controller: TextEditingController(),
                              hintFontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 32),

                      Row(
                        children: [
                          Text(
                            'تاریخ تولد : ',
                            style: TextStyle(
                              color: AppColors.bornDateColor,
                              fontSize: 18,
                              fontFamily: FontFamily.iranSansXRegular,
                            ),
                          ),

                          Spacer(),
                          BornDatePicker(),
                        ],
                      ),

                      SizedBox(height: 40),

                      TextFieldPrimary(
                        hintText: 'شماره موبایل',
                        controller: TextEditingController(),
                        isPhoneNumber: true,
                        width: 318,
                      ),
                      SizedBox(height: 32),
                      TextFieldOptional(
                        hintText: 'ایمیل',
                        controller: TextEditingController(),
                        width: 318,
                      ),
                      SizedBox(height: 32),

                      TitlePage(
                        title: 'زبان های مورد علاقه خود را انتخاب کنید.',
                        seeMoreIsText: true,
                        horizentalPadding: 0,
                        fontFamily: FontFamily.iranSansXRegular,
                        fontSize: 16,
                        onTap: () {},
                      ),

                      SizedBox(height: 43),

                      Row(
                        children: [
                          Expanded(
                            child: LanguageBox(
                              widgetIconOrImage: SvgPicture.asset(
                                Assets.images.britain,
                                fit: BoxFit.cover,
                              ),
                              title: 'انگلیسی',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: LanguageBox(
                              widgetIconOrImage: SvgPicture.asset(
                                Assets.images.italyFlag,
                                fit: BoxFit.cover,
                              ),
                              title: 'ایتالیایی',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: LanguageBox(
                              widgetIconOrImage: Image.asset(
                                Assets.images.russiaFlag.path,
                                fit: BoxFit.cover,
                              ),
                              title: 'روسی',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: LanguageBox(
                              widgetIconOrImage: SvgPicture.asset(
                                Assets.images.france,
                              ),
                              title: 'فرانسوی',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36),

                      Row(
                        children: [
                          TextFieldOptional(
                            hintText: 'کد معرف',
                            controller: TextEditingController(),
                            width: 184,
                          ),
                          Spacer(),
                          ButtonOutlinePrimary(
                            title: 'ثبت',
                            onPressed: () {},
                            strokeColor: AppColors.primaryColor,
                            width: 111,
                            height: 45,
                            fillColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      ButtonPrimary(title: 'تایید نهایی', onPressed: () {}),
                      SizedBox(height: 88),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(String imagePath, int index, int currentIndex) {
    final bool isCenter = index == currentIndex;
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_carouselController.ready) {
            _carouselController.animateToPage(
              index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
            );
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isCenter ? 1.0 : 0.6,
          child: SizedBox(
            width: 64,
            height: 64,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageBox extends StatelessWidget {
  const LanguageBox({
    super.key,
    required this.widgetIconOrImage,
    required this.title,
  });

  final Widget widgetIconOrImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: AppColors.languageBoxContainerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Transform.translate(
            offset: const Offset(8, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: widgetIconOrImage,
            ),
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: FontFamily.iranSansXMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class BornDatePicker extends StatefulWidget {
  const BornDatePicker({super.key});

  @override
  State<BornDatePicker> createState() => _BornDatePickerState();
}

class _BornDatePickerState extends State<BornDatePicker> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  final List<String> days = List.generate(
    31,
    (index) => (index + 1).toString().padLeft(2, '0'),
  );
  final List<String> months = List.generate(
    12,
    (index) => (index + 1).toString().padLeft(2, '0'),
  );
  final List<String> years = List.generate(
    100,
    (index) => (1405 - index).toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        _buildSelectBar(
          value: selectedDay,
          items: days,
          hint: "روز",
          onChanged: (val) => setState(() => selectedDay = val),
        ),
        const SizedBox(width: 16),
        _buildSelectBar(
          value: selectedMonth,
          items: months,
          hint: "ماه",
          onChanged: (val) => setState(() => selectedMonth = val),
        ),
        const SizedBox(width: 16),
        _buildSelectBar(
          value: selectedYear,
          items: years,
          hint: "سال",
          onChanged: (val) => setState(() => selectedYear = val),
        ),
      ],
    );
  }

  Widget _buildSelectBar({
    required String? value,
    required List<String> items,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: 64,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.bornDateContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              hint,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: FontFamily.iranSansXRegular,
              ),
            ),
          ),
          isExpanded: true,
          icon: SvgPicture.asset(Assets.images.downMakeAccount),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Center(
                child: Text(
                  val,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: FontFamily.iranSansXRegular,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
