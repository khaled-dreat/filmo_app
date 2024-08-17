import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:filmo_app/utils/theme/app_text_style.dart';
import 'package:filmo_app/view/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/c_api.dart';
import 'custom_txt_form_srh.dart';
import 'featured_popular_movies_listview.dart';
import 'section_headar.dart';
import 'now_playing.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ControllerApi cApi = Provider.of<ControllerApi>(context, listen: false);
      cApi.initRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerApi cApi = Provider.of<ControllerApi>(context);

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SectionHeadar(title: "title"),
                SizedBox(
                  height: 5,
                ),
                CustomTextFormSrh(),
              ],
            ),
          ),
          cApi.homeLoading
              ? const AppLoading()
              : const FeaturedNowPlayingListView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most popular",
                  style: AppTextStyle.h5Medium14(context),
                ),
                Text(
                  "See All",
                  style: AppTextStyle.h4Semibold16(context)
                      .copyWith(color: AppColors.blueAccent),
                )
              ],
            ),
          ),
          const FeaturedPopularMoviesListView()
        ],
      ),
    );
  }
}
