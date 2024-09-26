import '../../util/util.dart';

class LoginRepositories {
  Future<void> loginUser(String login, String password) async {
    final response = await dio.post(
      "$url/auth/token/login/",
      data: {
        "username": login,
        "password": password,
      },
    );

    settingsBox.put("token", response.data["auth_token"]);
    return;
  }
}
