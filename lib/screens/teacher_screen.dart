import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:ielts/widgets/button_primary.dart';
import 'package:ielts/widgets/text_fied_primary.dart';

class TeacherScreen extends StatelessWidget {
  TeacherScreen({super.key});

  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.shadowContainerTeacherScreenColor,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            Assets.images.bannerTeacherScreen.path,
                          ),
                        ),

                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -30,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.7,
                                color: AppColors.strokeAvatarTeacherScreenColor,
                              ),
                            ),

                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  Assets.images.mojAvatar.path,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 49),

                    Text(
                      'میلاد دهیامی',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: FontFamily.iranSansXBold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '@dehyamimilad',
                        style: TextStyle(
                          color: AppColors.primaryTextTeacherScreenColor,
                          fontSize: 12,
                          fontFamily: FontFamily.iranSansXRegular,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تدریس : ',
                          style: TextStyle(
                            color: AppColors.primaryTextTeacherScreenColor,
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                        Text(
                          'آیلتس ، تافل',
                          style: TextStyle(
                            color: AppColors.primaryTextTeacherScreenColor,
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.images.clock2),
                        SizedBox(width: 4),
                        Text(
                          'آخرین فعالیت 4 ساعت پیش',
                          style: TextStyle(
                            color: AppColors.primaryTextTeacherScreenColor,
                            fontSize: 12,
                            fontFamily: FontFamily.iranSansXRegular,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    ButtonPrimary(
                      title: 'دنبال کردن',
                      onPressed: () {},
                      height: 30,
                      width: 118,
                      borderRadius: 8,
                      fontSize: 12,
                      fontFamily: FontFamily.iranSansXMedium,
                    ),

                    SizedBox(height: 16),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 13,
                        runSpacing: 8,
                        children: [
                          IconTitleValue(
                            icon: Assets.images.calender,
                            title: 'تاریخ عضویت : ',
                            value: '1400',
                            widthSizedBox: 6,
                          ),
                          IconTitleValue(
                            icon: Assets.images.hat,
                            title: 'تعداد دوره ها : ',
                            value: '12',
                            widthSizedBox: 6,
                          ),
                          IconTitleValue(
                            icon: Assets.images.student,
                            title: 'تعداد دانشجوها : ',
                            value: '1203',
                            widthSizedBox: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.shadowContainerTeacherScreenColor,
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(11, 16, 11, 16),
                child: Column(
                  children: [
                    Text(
                      'درباره من',
                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXBold,
                        fontSize: 20,
                        color: AppColors.secondaryTeacherScreenColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '''سلام من میلاد هستم، تحصیلات من در رشته زبان و ادبیات 
اینگلیسی از دانشگاه خواجه نصیرالدین طوسی بوده و پس از
آن به تدریس زبان اینگلیسی و آمادگی برای آزمون های بین 
المللی پرداختم . من معتقدم که هر دانش آموزی پتانسیل بالایی دارد و می توان با برنامه ریزی مناسب و تمرین مداوم ، به موفقیت دست یابد.''',

                      style: TextStyle(
                        fontFamily: FontFamily.iranSansXRegular,
                        fontSize: 14,
                        color: AppColors.primaryTextTeacherScreenColor,
                        height: 2.28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(right: 24, left: 24, bottom: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -10,
                      color: AppColors.shadowContainerTeacherScreenColor,
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(11, 16, 11, 16),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'نیاز به مشاوره داری ؟',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXBold,
                          fontSize: 20,
                          color: AppColors.secondaryTeacherScreenColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '''اگر در انتخاب مسیر خود سردرگم هستید ، کافیه اطلاعات تماس
                خود را در فرم زیر ثبت کنید، بنده در اسرع وقت با شما جهت ارائه مشاوره رایگان تماس خواهم گرفت !''',
                        style: TextStyle(
                          fontFamily: FontFamily.iranSansXRegular,
                          fontSize: 14,
                          color: AppColors.primaryTextTeacherScreenColor,
                          height: 2.28,
                        ),
                      ),

                      SizedBox(height: 24),

                      Container(
                        padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.secondaryTeacherScreenColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Column(
                          children: [
                            TextFieldPrimary(
                              hintText: 'نام نام خانوادگی',
                              controller: fullName,
                              hintFontSize: 18,
                            ),
                            SizedBox(height: 11),
                            TextFieldPrimary(
                              hintText: 'شماره موبایل',
                              controller: phoneNumber,
                              isPhoneNumber: true,
                              hintFontSize: 18,
                            ),
                            SizedBox(height: 11),
                            ButtonPrimary(title: 'ثبت', onPressed: () {}),
                          ],
                        ),
                      ),
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
}

class IconTitleValue extends StatelessWidget {
  const IconTitleValue({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.widthSizedBox,
  });

  final String icon;
  final String title;
  final String value;
  final double widthSizedBox;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: widthSizedBox),

        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryTextTeacherScreenColor,
            fontSize: 12,
            fontFamily: FontFamily.iranSansXMedium,
          ),
        ),
        SizedBox(width: 2),
        Text(
          value,
          style: TextStyle(
            color: AppColors.primaryTextTeacherScreenColor,
            fontSize: 12,
            fontFamily: FontFamily.iranSansXMedium,
          ),
        ),
      ],
    );
  }
}
