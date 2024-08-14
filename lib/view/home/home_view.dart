import 'package:filmo_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const String nameRoute = "HomeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const [
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
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: HomeViewBody(),
    );
  }
}

class CustomSelectedIconBottomNavigationBar extends StatelessWidget {
  const CustomSelectedIconBottomNavigationBar(
      {super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .3,
      height: MediaQuery.sizeOf(context).height * .05,
      decoration: BoxDecoration(
        color: AppColors.soft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.cyan,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
