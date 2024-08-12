import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:filmo_app/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.height,
    required this.title,
    required this.onTap,
  });

  final double? height;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.darkGrey,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: height ?? 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title.toUpperCase(),
          style: AppTextStyle.h4Medium16(context),
        ),
      ),
    );
  }
}
