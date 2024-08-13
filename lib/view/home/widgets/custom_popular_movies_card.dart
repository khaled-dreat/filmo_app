import 'package:flutter/material.dart';

import '../../../api/app_api_key.dart';
import '../../../models/popular_movies/m_popular_movies.dart';
import 'custom_rating_widget.dart';

class CustomPopularMoviesCard extends StatelessWidget {
  const CustomPopularMoviesCard({super.key, required this.movies});
  final PopularMoviesModel movies;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  "${AppApiKey.hostImg}${movies.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movies.title!),
                    Text(movies.releaseDate!),
                  ],
                ),
              ),
            ),
          ],
        ),
        CustomRatingWidget(
          rating: movies.voteAverage!,
        )
      ],
    );
  }
}
