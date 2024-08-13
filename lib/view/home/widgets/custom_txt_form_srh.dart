import 'package:flutter/material.dart';
import '../../../../../../utils/theme/app_colors.dart';
import '../../../../../../utils/theme/app_text_style.dart';

class CustomTextFormSrh extends StatelessWidget {
  const CustomTextFormSrh({super.key, this.onTap, this.readOnly = false});
  final Function()? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
            size: 25,
          ),
          hintText: "Search",
          hintStyle: AppTextStyle.h5Medium14(context)
              .copyWith(color: AppColors.grey, fontSize: 14),
          fillColor: AppColors.soft,
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder()),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.transparent));
  }
}
