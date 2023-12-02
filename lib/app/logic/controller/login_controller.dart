import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  String? usernameValidate(String? username) {
    if (username!.isEmpty) {
      return "Please enter your username";
    }
    if (RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(username)&&username.length<8) {
      return "Length greater than 8 and no special key";
    }
  }

  String? passwordValidate(String? password) {
    if (password!.isEmpty) {
      return "Please enter your password";
    }
    //password.length < 0 ||
    if (RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)&&password.length<8) {
      return "Length greater than 8 and no special key";
    }
  }

  Future<void> login() async {
    // try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var url = Uri.parse(RequestApi.BaseUrl + RequestApi.API_LOGIN);
      var response = await http.post(
        url,
        body: jsonEncode({'username': username.text, 'password': password.text}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        // print('login successful');
        // print(response.body);
        final sessionCookie = response.headers['set-cookie'];
        User user = User.fromJson(jsonDecode(response.body));
        preferences.setString("sessionCookie", sessionCookie!);
        preferences.setString("id", '${user.id}');
        preferences.setString("username", '${user.username}');
        preferences.setString("email", '${user.email}');
        preferences.setBool('isLoggedIn', true);
        Get.off(() => MainWrapper());

      } else {
        errorMessage.value = 'Login failed. Please check your username or password!';
        throw Exception(errorMessage);
      }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
