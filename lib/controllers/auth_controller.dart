import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_assignment/models/user.dart';
import 'package:flutter_assignment/services/api_service.dart';
import 'package:flutter_assignment/utils/api_constants.dart';

class AuthController extends GetxController {
  final api = Get.find<ApiService>();

  User? currentUser;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var errorMessage = ''.obs;

  Future<void> checkSavedLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? email = prefs.getString('email');

    if (token == null || token.isEmpty || email == null || email.isEmpty) {
      return;
    }

    api.token = token;
    currentUser = User(
      email: email,
      name: prefs.getString('name'),
    );
    isLoggedIn.value = true;
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      var response = await api.postRequest(
        url: ApiConstants.login,
        body: {
          'email': email.trim(),
          'password': password,
        },
      );

      debugPrint('Login ${response.statusCode} ${response.body}');

      var json = jsonDecode(response.body);
      if (response.statusCode >= 400 || json['success'] == false) {
        errorMessage.value = json['message']?.toString() ?? 'Login failed';
        // debugPrint('Login error: ${errorMessage.value}');
        isLoading.value = false;
        return false;
      }

      var data = json['data'];
      var tokens = data['tokens'];
      api.token = tokens['access_token']?.toString();

      if (api.token == null || api.token!.isEmpty) {
        errorMessage.value = json['message']?.toString() ?? 'Login failed';
        // debugPrint('Login error: ${errorMessage.value}');
        isLoading.value = false;
        return false;
      }

      var userJson = data['user'] ?? data['users'];
      if (userJson == null) {
        currentUser = User(email: email.trim());
      } else {
        currentUser = User.fromJson(Map<String, dynamic>.from(userJson));
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', api.token!);
      await prefs.setString('email', currentUser!.email);
      await prefs.setString('name', currentUser!.name ?? '');

      isLoggedIn.value = true;
      isLoading.value = false;
      return true;
    } catch (e) {
      // debugPrint('Login error: $e');
      errorMessage.value = 'Something went wrong. Please try again.';
      isLoading.value = false;
      return false;
    }
  }

  Future<void> logout() async {
    api.token = null;
    currentUser = null;
    isLoggedIn.value = false;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('email');
    await prefs.remove('name');
  }
}
