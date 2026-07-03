import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/gen/fonts.gen.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'بازگشت',
            style: TextStyle(
              fontFamily: FontFamily.iranSansXMedium,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(Assets.images.leftCheveron),
        ],
      ),
    );
  }
}
