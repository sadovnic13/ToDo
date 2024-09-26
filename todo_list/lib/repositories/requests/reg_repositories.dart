import 'package:flutter/material.dart';

import '../../util/util.dart';

class RegistrationRepositories {
  Future<void> registrationUser(String login, String password) async {
    final response = await dio.post(
      "$url/auth/users/",
      data: {"username": login, "password": password},
    );
    debugPrint("ERROR");
    
    debugPrint(response.toString());
    return;
  }
}
