import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';
import '../../../utils/theme/app_text_style.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: AppColors.soft.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Icon(Icons.star, color: AppColors.orange, size: 14),
            const SizedBox(width: 4),
            Text(
              rating.toString(),
              style: AppTextStyle.h6Semibold12(context)
                  .copyWith(color: AppColors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
