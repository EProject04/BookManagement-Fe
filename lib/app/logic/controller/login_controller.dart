
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/data/utils/shared_preference_util.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  RxBool isHidden = true.obs;
  // SharedPreferences sharedpref = SharedPrefs.instance;

  String? usernameValidate(String? username){
    if(username!.isEmpty){
      return "Please enter your username";
    }
    // if(!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(username)){
    //   return "Incorrect phone number";
    // }
  }
  String? passwordValidate(String? password){
    if(password!.isEmpty){
      return "Please enter your password";
    }
    //password.length < 0 ||
    if( RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
      return "Length greater than 8 and no special key";
    }
  }

  Future<void> login(String username, String password) async{
    try{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_LOGIN);

      var response = await http.post(
        url,
        body: jsonEncode({
          'username': username,
          'password': password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if(response.statusCode == 200){
        // print('login successful');
        // print(response.body);
        final sessionCookie = response.headers['set-cookie'];
        User user = User.fromJson(jsonDecode(response.body));
        preferences.setString("sessionCookie", sessionCookie!);
        preferences.setString("id", '${user.id}');
        preferences.setString("username", '${user.username}');
        preferences.setString("email", '${user.email}');
        print('${user.email}');
        print(sessionCookie);
        Get.to(()=>MainWrapper());

      }else{
        throw Exception('Login Failed');
      }

    }catch(e){
      print(e);

    }

  }


}
