import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class LoginController extends GetxController{
  RxBool isHidden = true.obs;


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
      var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_LOGIN);

      http.Response response = await http.post(
        url,
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password
        }),
        headers: <String, String>{
          'Access-Control_Allow_Origin': '*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(response.statusCode == 200){
        print('login successful');
        print(response.body);
        Get.to(()=>HomePage());
      }else{
        print('failed');
      }
    }catch(e){
      print(e.toString());

    }
  }


}
