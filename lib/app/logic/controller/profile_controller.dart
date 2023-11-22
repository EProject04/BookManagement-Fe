import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/user_profile.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/view/personal_info/personal_info_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  var isLoading = true.obs;
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController imagePath = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController editEmail = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    getUserProfileById();
    super.onInit();

  }



  Future<UserProfile> completeYourProfile(String userId, UserProfile updateProfile) async{
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_USERPROFILE_PUT +userId);

    http.Response response = await http.put(
        url,
        body: jsonEncode(updateProfile),
        headers: headers
    );
    isLoading(false);
    if(response.statusCode == 200){
      return UserProfile.fromJson(jsonDecode(response.body));
      print(json);

    }else{
      throw Exception('Failed to update user profile');
    }

  }

  Future<void> getUserProfileById() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString('id');
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_USERPROFILE_GET_ID+id.toString());
    var response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      UserProfile user = UserProfile.fromJson(result);
      // fullName.text = result['fullName'];
      email.text = result['email'].toString();
      phoneNumber.text = result['phoneNumber'].toString();
      dob.text = result['dateOfBirth'].toString();
      fullName.text = result['fullName'].toString();
      print(result['phoneNumber']);
    }else{
      throw Exception('User not found');
    }
  }
}