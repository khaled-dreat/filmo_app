import 'dart:developer';

import 'package:filmo_app/api/app_api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

  Future<String> createRequestToken() async {
    final response = await http.get(Uri.parse(AppApiKey.host));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['request_token'];
    } else {
      throw Exception('Failed to create request token');
    }
  }

  Future<bool?> createSession(String requestToken) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/validate_with_login');
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOWIxMGFkZWEzYzRhMTBlOGFiNDY0MmFmODNjZjViZSIsIm5iZiI6MTcyMzIxMjQzOS43MTA0MjksInN1YiI6IjY2YjFmNjVkM2RjNGJmZjEzYjc1NzE4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-OwMevthWvlaaFNK6hEzYSub5-NTmqUYka6e80AtL08',
      'accept': 'application/json',
      'content-type': 'application/json',
    };
    final body = jsonEncode({
      'username': userAuth.userName,
      'password': userAuth.password,
      'request_token': requestToken,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log(name: "stats of login", data['success'].toString());
      return data['success'];
    } else {
      log('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  }

  Future<bool?> login() async {
    String requestToken = await createRequestToken();
    bool? success = await createSession(requestToken);
    return success;
  }
}
