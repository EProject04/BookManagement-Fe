import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class RegisterController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> register() async{
    try{
      var headers = {
        'Content-Type': 'application/json'
      };
      var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_REGISTER);
      Map body = {
        'username' : usernameController.text,
        'email' : emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers
      );
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);

      }
    }catch(e){

    }
  }
}