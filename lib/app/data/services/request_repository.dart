import 'package:frame/app/data/models/user.dart';
import 'package:frame/app/data/services/http_request.dart';
import 'package:frame/app/data/services/request.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/data/utils/sp_util.dart';

typedef SuccessOver<T> = Function(T data, bool over);

class RequestRepository {
  //Register with api [username], [email], [password]
  register(
    dynamic username,
    dynamic email,
    dynamic password, {
    Success<User>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.API_REGISTER, {
      "username": username,
      "email": email,
      "password": password
    }, success: (data) {
      var registerUser = User.fromJson(data);
      registerUser.password = password;
      SpUtil.putUserInfo(registerUser);
      if (success != null) {
        success(registerUser);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  //Login with api
  login(
    dynamic username,
    dynamic password, {
    Success<User>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
        RequestApi.API_LOGIN, {"username": username, "password": password},
        success: (data) {
      var loginUser = User.fromJson(data);
      loginUser.password = password;
      SpUtil.putUserInfo(loginUser);
      if (success != null) {
        success(loginUser);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }
}
