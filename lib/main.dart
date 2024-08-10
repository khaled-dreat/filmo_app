import 'package:filmo_app/controller/c_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app_start/app_start.dart';

void main() {
  runApp(MultiProvider(providers: providerList, child: const AppStart()));
}

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => ControllerAuth()),
];
