import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';
import '../../../utils/theme/app_text_style.dart';

class CustomSowingTodayMovieData extends StatelessWidget {
  const CustomSowingTodayMovieData({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.grey),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style:
              AppTextStyle.h6Medium12(context).copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
