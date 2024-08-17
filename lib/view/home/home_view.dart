import 'package:filmo_app/view/search/search_view.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_selected_icon_bottom_navigation_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const String nameRoute = "HomeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeViewBody(),
    const SearchView(),
    const HomeViewBody(),
  ];
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '',
        activeIcon: CustomSelectedIconBottomNavigationBar(
          icon: Icons.home,
          label: "Home",
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: '',
        activeIcon: CustomSelectedIconBottomNavigationBar(
          icon: Icons.search,
          label: "Search",
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '',
        activeIcon: CustomSelectedIconBottomNavigationBar(
          icon: Icons.person,
          label: "Profile",
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
