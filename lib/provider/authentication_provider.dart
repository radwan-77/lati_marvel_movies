import 'dart:convert';

import 'package:lati_marvel_movies/provider/base_provoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends BaseProvider {
  bool authenticated = false;

  initializeAuthProvider() async {
    setProcess(true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    authenticated = (token != null);

    print("Bearer Token is : $token");
    print("Auth Status is : $authenticated");

    setProcess(false);
  }

  Future<List> register(Map body) async {
    setProcess(true);

    final response =
        await api.postRequest("https://lati.kudo.ly/api/register", body);

    if (response.statusCode == 200) {
      setError(false);
      setProcess(false);

      return [true, json.decode(response.body)['data']];
    } else {
      setError(true);
      setProcess(false);

      return [false, json.decode(response.body)['message']];
    }
  }

  Future<List> login(Map body) async {
    setProcess(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
        await api.postRequest("https://lati.kudo.ly/api/login", body);

    if (response.statusCode == 200) {
      prefs.setString("token", json.decode(response.body)['access_token']);
      setError(false);
      setProcess(false);

      return [true, "Logged in successfully"];
    } else {
      prefs.clear();
      setError(true);
      setProcess(false);

      return [false, "Login failed!"];
    }
  }

  logout() async {
    setProcess(true);

    final response =
        await api.postRequest("https://lati.kudo.ly/api/logout", {});

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      setError(false);
      setProcess(false);
      return true;
    } else {
      setError(true);
      setProcess(false);
      return false;
    }
  }

  refreshToken() {}

  getMe() {}
}
