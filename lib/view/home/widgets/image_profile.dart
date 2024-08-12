import 'package:filmo_app/utils/constant/app_images.dart';
import 'package:flutter/material.dart';

import '../../widgets/loading/app_loading.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: const AssetImage(Assets.imgAvatar),
        errorBuilder: (context, error, stackTrace) => const Image(
          image: AssetImage(Assets.imgAvatar),
        ),
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const Center(
                  child: AppLoading(loading: TypeLoading.profile),
                );
        },
      ),
    );
  }
}
