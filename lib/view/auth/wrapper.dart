import 'package:filmo_app/view/auth/sign_in.dart';
import 'package:flutter/material.dart';

import '../home/home_view.dart';
import '../widgets/loading/app_loading.dart';

class Wrapper extends StatelessWidget {
  static const String nameRoute = 'Wrapper';
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoading(loading: TypeLoading.page);
            }
            return snapshot.hasData ? const HomeView() : const SingInView();
          }),
    );
  }
}
