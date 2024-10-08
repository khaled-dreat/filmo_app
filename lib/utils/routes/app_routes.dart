import 'package:flutter/material.dart';

import '../../view/auth/sign_in.dart';
import '../../view/auth/wrapper.dart';
import '../../view/home/home_view.dart';
import '../../view/search/search_view.dart';

class AppRoutes {
  // * Pages  App
  static Map<String, WidgetBuilder> routes = {
    Wrapper.nameRoute: (context) => const Wrapper(),
    SingInView.nameRoute: (context) => const SingInView(),
    HomeView.nameRoute: (context) => const HomeView(),
    SearchView.nameRoute: (context) => const SearchView(),
  };

  // * inti Route
  static String? get initRoute => HomeView.nameRoute;

  // * push Name
  static void go(BuildContext context, String nameRoute) =>
      Navigator.pushNamed(context, nameRoute);
  // * push Name Replace
  static void goReplace(BuildContext context, String nameRoute) =>
      Navigator.pushReplacementNamed(context, nameRoute);

  // * push Name
  static void goMaterial(BuildContext context, Widget page) {
    MaterialPageRoute<Widget> route =
        MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }
}

// * / -> index  -> home page
// * /setting
// * /about
