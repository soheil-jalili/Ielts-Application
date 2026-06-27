import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';

class CourseTitle extends StatelessWidget {
  const CourseTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: FontFamily.iranSansXDemiBold,
          ),
        ),
        Spacer(),
        Text(
          'بازگشت',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: FontFamily.iranSansXMedium,
          ),
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          Assets.images.leftCheveron,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ],
    );
  }
}
