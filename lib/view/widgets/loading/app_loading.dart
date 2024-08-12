import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:flutter/material.dart';

enum TypeLoading { profile, image, page, webview, send }

class AppLoading extends StatefulWidget {
  const AppLoading({super.key, this.loading, this.size});
  final TypeLoading? loading;
  final double? size;

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    switch (widget.loading ?? TypeLoading.image) {
      // * image
      case TypeLoading.image:
        return LoadingAnimationWidget.fourRotatingDots(
            color: AppColors.blueAccent, size: 15);
      // * profile
      case TypeLoading.profile:
        return LoadingAnimationWidget.discreteCircle(
          color: AppColors.blueAccent,
          size: 15,
        );
      // * page
      case TypeLoading.page:
        return LoadingAnimationWidget.inkDrop(
            color: AppColors.blueAccent, size: 15);

      // * webview
      case TypeLoading.webview:
        return LoadingAnimationWidget.twistingDots(
          leftDotColor: AppColors.blueAccent,
          rightDotColor: AppColors.grey,
          size: 15,
        );

      // * send
      case TypeLoading.send:
        return LoadingAnimationWidget.dotsTriangle(
            color: AppColors.blueAccent, size: 15);
    }
  }
}
