import 'package:filmo_app/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../utils/theme/app_theme_choose.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * Route
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initRoute,
      // * Theme
      theme: AppThemeChoose.light(context),
      darkTheme: AppThemeChoose.dark(context),
      themeMode: ThemeMode.dark,
    );
  }
}
