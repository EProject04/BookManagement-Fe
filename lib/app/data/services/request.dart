


import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/services/http_request.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/data/services/request_result.dart';
import 'package:frame/app/data/utils/get_extension.dart';
import 'package:frame/app/data/utils/toast_util.dart';
import 'package:get/get.dart';

class Request {
  /// Gửi yêu cầu GET
  /// [url] URL yêu cầu
  /// [parameters] Tham số yêu cầu
  /// [success] Phản hồi thành công
  /// [fail] Phản hồi thất bại
  static void get<T>(
      String url,
      parameters, {
        bool isJson = false,
        bool dialog = true,
        Success<T>? success,
        Fail? fail,
      }) {
    _request(Method.GET, url, parameters, isJson: isJson, dialog: dialog, success: success, fail: fail);
  }

  /// Gửi yêu cầu POST
  /// [url] URL yêu cầu
  /// [parameters] Tham số yêu cầu
  /// [success] Phản hồi thành công
  /// [fail] Phản hồi thất bại
  static void post<T>(
      String url,
      parameters, {
        bool isJson = false,
        bool dialog = true,
        Success<T>? success,
        Fail? fail,
      }) {
    _request(Method.POST, url, parameters, isJson: isJson, dialog: dialog, success: success, fail: fail);
  }

  /// Gửi yêu cầu
  /// [method] Loại yêu cầu
  /// [url] URL yêu cầu
  /// [parameters] Tham số yêu cầu
  /// [success] Phản hồi thành công
  /// [fail] Phản hồi thất bại
  static void _request<T>(
      Method method,
      String url,
      parameters, {
        bool isJson = false,
        bool dialog = true,
        Success<T>? success,
        Fail? fail,
      }) {
    if (dialog) {
      Get.showLoading();
    }
    debugPrint("request url ==============> ${RequestApi.BaseUrl}$url");
    /// Kiểm tra tham số có chứa URL không
    parameters.forEach((key, value) {
      if (url.contains(key)) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    /// Bắt đầu yêu cầu
    HttpRequest.request(method, url, parameters, isJson: isJson, success: (result) {
      if (dialog) {
        Get.dismiss();
      }
      if (success != null) {
        var resultModel = Result.fromJson(result);
        debugPrint("request success =>$resultModel");
        if (resultModel.errorCode == 0) {
          success(resultModel.data);
        } else {
          /// Các trạng thái khác, hiển thị thông báo lỗi
          ToastUtils.show(resultModel.errorMsg);
        }
      }
    }, fail: (code, msg) {
      debugPrint("request error =>$msg");
      if (dialog) {
        Get.dismiss();
      }
      ToastUtils.show(msg);
      if (fail != null) {
        fail(code, msg);
      }
    });
  }
}