import 'package:flutter/material.dart';

import '../../../api/app_api_key.dart';
import '../../../models/search/m_search.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/theme/app_text_style.dart';
import '../../home/widgets/custom_rating_widget.dart';
import 'custom_sowing_today_movie_data.dart';

class CustomSrhBooksCard extends StatelessWidget {
  const CustomSrhBooksCard({
    super.key,
    required this.movie,
  });

  final SearchModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 220,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Image.network(
                    "${AppApiKey.hostImg}${movie.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
                CustomRatingWidget(
                  rating: movie.voteAverage!,
                )
              ],
            )),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title!,
                style: AppTextStyle.h4Semibold16(context),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomSowingTodayMovieData(
                  icon: Icons.calendar_month, title: movie.releaseDate!),
              const SizedBox(
                height: 10,
              ),
              CustomSowingTodayMovieData(
                  icon: Icons.language,
                  title: movie.originalLanguage!.toUpperCase()),
              const SizedBox(
                height: 15,
              ),
              Text(
                movie.overview!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.h5Regular14(context)
                    .copyWith(color: AppColors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
