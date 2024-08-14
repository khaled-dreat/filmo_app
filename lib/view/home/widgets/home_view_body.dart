import 'package:filmo_app/api/app_api_key.dart';
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
      ControllerApi CApi = Provider.of<ControllerApi>(context, listen: false);
      CApi.initRequest();
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

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Categories",
          style: AppTextStyle.h4Semibold16(context),
        ),
        CategorySelector()
      ],
    );
  }
}

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Comedy',
    'Animation',
    'Dokument',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              width: 100,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? AppColors.soft // Background color for selected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                categories[index],
                style: AppTextStyle.h6Medium12(context).copyWith(
                    color: _selectedIndex == index
                        ? AppColors.blueAccent
                        : AppColors.whiteGrey),
              ),
            ),
          );
        },
      ),
    );
  }
}
