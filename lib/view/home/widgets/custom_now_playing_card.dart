import 'package:filmo_app/api/app_api_key.dart';
import 'package:flutter/material.dart';
import '../../../models/now_playing/m_now_playing.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/theme/app_text_style.dart';

class CustomNowPlayingCard extends StatelessWidget {
  const CustomNowPlayingCard({
    super.key,
    required this.results,
  });

  final NowPlayingModel results;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "${AppApiKey.hostImg}${results.backdropPath}",
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.bottomLeft,
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: "${results.title}\n",
              style: AppTextStyle.h4Semibold16(context),
              children: <TextSpan>[
                TextSpan(
                    style: AppTextStyle.h6Medium12(context).copyWith(
                      color: AppColors.whiteGrey,
                    ),
                    text: "${results.releaseDate}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
