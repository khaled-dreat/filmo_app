import 'package:flutter/material.dart';

class SectionHeadar extends StatelessWidget {
  const SectionHeadar({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          //    style: AppTheme.h5(context),
        ),
        //  IconButton(
        //      onPressed: onPressed,
        //      icon: Icon(AppLang.currentLang(context) == kEn
        //          ? Icons.keyboard_double_arrow_right_outlined
        //          : Icons.keyboard_double_arrow_left_outlined))
      ],
    );
  }
}
