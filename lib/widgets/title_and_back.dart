import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';

class TitleAndBack extends StatelessWidget {
  const TitleAndBack({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
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
        GestureDetector(
          onTap: onTap,
          child: Text(
            'بازگشت',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: FontFamily.iranSansXMedium,
            ),
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
