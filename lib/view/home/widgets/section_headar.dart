import 'package:filmo_app/utils/constant/app_images.dart';
import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../utils/theme/app_text_style.dart';
import 'image_profile.dart';

class SectionHeadar extends StatelessWidget {
  const SectionHeadar({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40,
              padding: const EdgeInsets.only(right: 10),
              child: const ImageProfile()),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Hello, Smith\n",
              style: AppTextStyle.h5Semibold14(context).copyWith(fontSize: 24),
              children: <TextSpan>[
                TextSpan(
                  style: AppTextStyle.h6Medium12(context).copyWith(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                  text: "Let’s stream your favorite movie",
                ),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.imgWishlist)
        ],
      ),
    );
  }
}
