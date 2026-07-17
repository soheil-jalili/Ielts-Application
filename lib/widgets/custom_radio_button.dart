import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isClicked;
  const CustomRadioButton({super.key, required this.isClicked});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: widget.isClicked
              ? Colors.transparent
              : AppColors.radioButtonStrokeColor,
        ),

        color: widget.isClicked ? AppColors.radioButtonFillColor : null,
      ),
      child: widget.isClicked
          ? Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
