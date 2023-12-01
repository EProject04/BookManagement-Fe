import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/models/user_profile.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/logic/controller/main_wrapper_controller.dart';
import 'package:frame/app/view/personal_info/personal_info_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController{

  Future<void> logout()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_LOGOUT);
    var response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){

      print('logout successful');

    }else{
      throw Exception('failed to logout');
    }
    // await preferences.clear();

  }

}