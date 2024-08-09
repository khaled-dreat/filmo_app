import 'package:flutter/material.dart';

import '../models/auth/m_auth_user.dart';
import '../utils/constant/app_icons.dart';

class ControllerAuth extends ChangeNotifier {
  // ******************** Eye ********************
  IconData icon = AppIcons.showPass;
  bool isNotShowPass = true;

  void changeIcon() {
    if (isNotShowPass) {
      isNotShowPass = false;
      icon = AppIcons.noShowPass;
    } else {
      isNotShowPass = true;
      icon = AppIcons.showPass;
    }
    notifyListeners();
  }

  // *************** Auth User ***********
  ModelAuthUser userAuth = ModelAuthUser();

  String currentPass = '';

  void setCurrentPass(String value) {
    currentPass = value;
  }

  // * Firebase Auth

  bool loading = false;
  String errorMessage = '';

  set changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  set updateMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }
}
