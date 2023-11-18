import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/user_profile.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController{

  TextEditingController fullName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController dobController = TextEditingController();



  Future<UserProfile> completeYourProfile(String userId, UserProfile updateProfile) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_USERPROFILE_PUT +userId);

    http.Response response = await http.put(
        url,
        body: jsonEncode(updateProfile),
        headers: headers
    );
    if(response.statusCode == 200){
      return UserProfile.fromJson(jsonDecode(response.body));
      print(json);
    }else{
      throw Exception('Failed to update user profile');
    }
  }

  Future<UserProfile> getUserProfileById(String userId) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_USERPROFILE_GET_ID +userId);

    http.Response response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){
      final json = UserProfile.fromJson(jsonDecode(response.body));
      print(json);
      return json;

    }else{
      throw Exception('Failed to update user profile');
    }
  }
}