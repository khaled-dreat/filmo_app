import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

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
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
