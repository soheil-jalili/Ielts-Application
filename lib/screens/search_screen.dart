import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/title_and_back.dart';
import 'package:ielts/widgets/student_and_learn_language.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool isShowMic = true;
  final bool _isLoading = true;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndBack(title: 'جستجو'),

                    Container(
                      margin: EdgeInsets.only(top: 14, bottom: 26),
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.images.searchSearchScreen,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {
                                  if (_searchController.text.isNotEmpty) {
                                    isShowMic = value.isEmpty;
                                  }
                                });
                              },
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: FontFamily.iranSansXRegular,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              onSubmitted: (value) {},
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'جستجو',
                                hintStyle: TextStyle(
                                  fontFamily: FontFamily.iranSansXRegular,
                                  fontSize: 16,
                                  color: AppColors.hintTextSearchScreenColor,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),

                          isShowMic
                              ? GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    Assets.images.mic,
                                    width: 24,
                                    height: 24,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isShowMic = true;
                                      _searchController.clear();
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    Assets.images.deleteInput,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(
                                  left: index == 1 ? 7 : 3,
                                ),
                                child: index != 2
                                    ? ContainerWithText(
                                        title: 'استاد',
                                        isFillable: index == 0 ? true : false,
                                      )
                                    : ContainerWithText(
                                        icon: Assets.images.plus,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),

                          Row(
                            children: [
                              Container(
                                width: 1.1,
                                height: 22,
                                color: AppColors.verticalLineSearchScreenColor,
                              ),
                              SizedBox(width: 6.6),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  Assets.images.sort,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.clock2,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'تاریخچه جستجوهای شما',
                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXMedium,
                              fontSize: 16,
                              color:
                                  AppColors.searchResultTextSearchScreenColor,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(Assets.images.trash),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 35,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: index == 9 ? 0 : 8),
                          child: ContainerWithText(
                            title: 'مکالمه',
                            haveLeftIcon: true,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 22, bottom: 26),
                      width: double.infinity,
                      height: 1,
                      color: AppColors.horizentalLineSearchScreenColor,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.images.fire),
                          SizedBox(width: 8),
                          Text(
                            'جستجو های پرطرفدار',

                            style: TextStyle(
                              fontFamily: FontFamily.iranSansXMedium,
                              fontSize: 16,
                              color:
                                  AppColors.popularSearchTextSearchScreenColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 35,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: index == 9 ? 0 : 8),
                          child: ContainerWithText(
                            title: 'دوره های آیلتس',
                            haveLeftIcon: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search Result
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 100),
              sliver: SliverList.builder(
                itemCount: _isLoading ? 6 : 20,
                itemBuilder: (context, index) {
                  if (_isLoading) {
                    return Container(
                      padding: const EdgeInsets.only(left: 15, right: 12.62),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors
                                .borderBottomSearchResultSearchScreenColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.baseColorShimmer,
                        highlightColor: AppColors.highlightColorShimmer,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 9.58,
                                bottom: 10.35,
                              ),
                              child: Container(
                                width: 73.28,
                                height: 72.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                  bottom: 14,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 17.95,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    const SizedBox(height: 17.95),
                                    Container(
                                      width: double.infinity,
                                      height: 17.95,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Container(
                    padding: const EdgeInsets.only(left: 15, right: 12.62),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(0),
                          offset: const Offset(0, 16),
                          blurRadius: 32,
                          spreadRadius: -10,
                        ),
                      ],
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors
                              .borderBottomSearchResultSearchScreenColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 9.58,
                            bottom: 10.35,
                          ),
                          child: StudentAndLanguageBox(
                            index: index,
                            width: 73.28,
                            height: 72.06,
                            widthImage: 63,
                            heightImage: 63,
                            leftSide: 12,
                            flagHeightImage: 21,
                            flagWidthImage: 21,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, bottom: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مجتبی یزدان پناه',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXBold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'استاد زبان های خارجه دانشگاه صنعتی شریف',
                                style: TextStyle(
                                  fontFamily: FontFamily.iranSansXRegular,
                                  fontSize: 9,
                                  color: AppColors.tertiaryTextColor,
                                ),
                              ),
                              const SizedBox(height: 13),
                              Row(
                                children: [
                                  Text(
                                    'مهارت ها :',
                                    style: TextStyle(
                                      fontFamily: FontFamily.iranSansXRegular,
                                      fontSize: 12,
                                      color: AppColors.tertiaryTextColor,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    [
                                      'مکالمه',
                                      'کسب و کار',
                                      'آیلتس',
                                    ].join(' ، '),
                                    style: TextStyle(
                                      fontFamily: FontFamily.iranSansXDemiBold,
                                      fontSize: 12,
                                      color: AppColors.quaternaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          width: 40,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.fillStarSearchScreenColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.7',
                                style: TextStyle(
                                  fontFamily: FontFamily.gilroyMedium,
                                  fontSize: 10,
                                  color: AppColors.rateTextSearchScreenColor,
                                ),
                              ),
                              const SizedBox(width: 4.92),
                              SvgPicture.asset(
                                Assets.images.starBold,
                                width: 11,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // For NotFound
            SliverToBoxAdapter(
              child: Visibility(
                visible: false,
                child: Container(
                  margin: EdgeInsets.only(top: 94),
                  child: Center(
                    child: SvgPicture.asset(Assets.images.notFound),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWithText extends StatelessWidget {
  const ContainerWithText({
    super.key,
    this.icon,
    this.title,
    this.isFillable = false,
    this.haveLeftIcon = false,
  });

  final String? title;
  final String? icon;

  final bool isFillable;
  final bool haveLeftIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title != null) {
          debugPrint('ContainerWithText tapped: $title');
        } else {
          debugPrint('ContainerWithText tapped: icon');
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: !isFillable
              ? Border.all(color: AppColors.borderSearchScreenColor, width: 1)
              : null,
          color: isFillable
              ? AppColors.activContainereSearchScreenColor
              : AppColors.fillContainereSearchScreenColor,
        ),
        child: icon != null
            ? SvgPicture.asset(icon!, width: 12, height: 12)
            : Row(
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontFamily: FontFamily.iranSansXMedium,
                      fontSize: 12,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),

                  if (haveLeftIcon) ...{
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      Assets.images.leftCheveron,
                      width: 4,
                      height: 8.67,
                      colorFilter: ColorFilter.mode(
                        AppColors.containerLeftIconSearchScreenColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  },
                ],
              ),
      ),
    );
  }
}
