



import 'dart:convert';

import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/models/user_profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil{

  static notifyUserInfo(UserProfile userinfo){
  }

  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove("user");
  }

  static putUserInfo(User user) {
    Get.find<SharedPreferences>()
        .setString("user", jsonEncode(user.toJson()));
  }
}