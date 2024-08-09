import 'package:filmo_app/utils/constant/app_images.dart';
import 'package:flutter/material.dart';

class AuthAppIcon extends StatelessWidget {
  const AuthAppIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(Assets.imgLogo),
      width: 100,
    );
  }
}
