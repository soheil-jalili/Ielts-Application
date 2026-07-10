import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/assets.gen.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.width = 53,
    this.height = 53,
    this.imageName,
  });

  final double width;
  final double height;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.strokeProfileColor, width: 0.7),
      ),
      child: Image.asset(imageName ?? Assets.images.hiroHamada1.path),
    );
  }
}
