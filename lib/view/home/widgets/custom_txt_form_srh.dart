import 'package:filmo_app/controller/c_api.dart';
import 'package:filmo_app/models/search/m_search_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      onFieldSubmitted: (value) async {
        Provider.of<ControllerApi>(context, listen: false).searchModel =
            SearchListModel();
        await Provider.of<ControllerApi>(context, listen: false)
            .getSearchResult(
          srhText: value,
        );
      },
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
            size: 25,
          ),
          hintText: "Type title, categories, years, etc",
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
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent));
  }
}
