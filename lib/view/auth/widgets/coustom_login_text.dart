import 'package:flutter/material.dart';

import '../../../utils/theme/app_text_style.dart';

class CoustomLoginText extends StatelessWidget {
  const CoustomLoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Hi, Tiffany \n",
          style: AppTextStyle.h5Semibold14(context).copyWith(fontSize: 24),
          children: <TextSpan>[
            const TextSpan(text: ' '),
            TextSpan(
              style: AppTextStyle.h6Medium12(context).copyWith(fontSize: 14),
              text: "Welcome back! Please enter your details.",
            ),
          ],
        ),
      ),
    );
  }
}
