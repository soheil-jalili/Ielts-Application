import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';

class IconLeft extends StatelessWidget {
  const IconLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 6, 11, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(56),
          bottomRight: Radius.circular(56),
        ),
        color: AppColors.primaryColor,
      ),
      child: SvgPicture.asset(Assets.images.leftCheveron, width: 7, height: 12),
    );
  }
}
