import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/c_api.dart';
import '../../../utils/theme/app_colors.dart';
import 'custom_popular_movies_card.dart';

class FeaturedPopularMoviesListView extends StatelessWidget {
  const FeaturedPopularMoviesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ControllerApi cApi = Provider.of<ControllerApi>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cApi.popularMovies.length,
          itemBuilder: (context, index) {
            return Container(
              width: 160,
              height: 230,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: AppColors.soft,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CustomPopularMoviesCard(
                movies: cApi.popularMovies.elementAt(index),
              ),
            );
          }),
    );
  }
}
