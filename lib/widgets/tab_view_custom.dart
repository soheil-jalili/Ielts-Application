import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';

class TabViewCustom extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;
  final List<String> titles;

  const TabViewCustom({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1.93),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.coruseDetailScreenTabViewColor,
      ),
      child: Row(
        children: [
          for (int i = 0; i < titles.length; i++)
            _buildTabItem(title: titles[i], index: i),
        ],
      ),
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.courseDetailScreenShadowTabColor,
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.iranSansXDemiBold,
                fontSize: 14,
                color: isSelected
                    ? AppColors.courseDetailScreenPrimaryColor
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}