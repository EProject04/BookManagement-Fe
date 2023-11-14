import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class RegisterController extends GetxController{
  RxBool isHidden = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? usernameValidate(String? username){
    if(username!.isEmpty){
      return "Please enter your username";
    }
    // if(!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(username)){
    //   return "Incorrect phone number";
    // }
  }

  String? emailValidate(String? email){
    if(email!.isEmpty){
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

  String? confirmValidate(String? confirmPassword){
    if(confirmPassword!.isEmpty){
      return "Please enter your confirm password";
    }
    if(confirmPassword != passwordController){
      return "Your confirm password is not match";
    }
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> register() async{

      var headers = {
        'Content-Type': 'application/json'
      };
      var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_REGISTER);
      Map body = {
        'username' : usernameController.text,
        'email' : emailController.text.trim(),
        'password': passwordController.text,
        'roleId':3
      };
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers
      );
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        print(json);
      }else{
        print('false');
      }

  }
}