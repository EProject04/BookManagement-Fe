
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/services/http_exception.dart';
import 'package:frame/app/data/services/request_api.dart';

const dynamic _connectTimeout = 10000;
const dynamic _receiveTimeout = 10000;
const dynamic _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class HttpRequest {

  // static const String _token ='';

  static Dio? _dio;

  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      /// Thuộc tính toàn cục: tiền tố yêu cầu, thời gian chờ kết nối, thời gian chờ phản hồi
      var options = BaseOptions(
        /// Phương thức gửi: 1. Gửi biểu mẫu 2. Gửi JSON
        /// Loại nội dung của yêu cầu, giá trị mặc định là "application/json; charset=utf-8".
        /// Nếu bạn muốn mã hóa dữ liệu yêu cầu theo định dạng "application/x-www-form-urlencoded",
        /// Bạn có thể đặt tùy chọn này thành `Headers.formUrlEncodedContentType`,
        /// như vậy [Dio] sẽ tự động mã hóa nội dung yêu cầu.
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        // Thích hợp cho biểu mẫu đăng ký form
        // responseType: ResponseType.json,
        validateStatus: (status) {
          /// Không sử dụng mã trạng thái http để xác định trạng thái, sử dụng AdapterInterceptor để xử lý (thích hợp cho phong cách REST tiêu chuẩn)
          return true;
        },
        baseUrl: RequestApi.BaseUrl,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
    }
    _dio?.options.contentType =
    isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

/// Yêu cầu, trả về tham số là T
/// [method]：Phương thức yêu cầu, Method.POST, v.v.
/// [path]：Địa chỉ yêu cầu
/// [params]：Tham số yêu cầu
/// [success]：Phản hồi thành công
/// [error]：Phản hồi thất bại
  static Future request<T>(Method method, String path, dynamic params,
      {bool isJson = false, Success? success, required Fail? fail}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(HttpException.netError, 'Lỗi kết nối mạng, vui lòng kiểm tra mạng của bạn!', fail);
        return;
      }
      Dio _dio = createInstance(isJson);
      Response response = await _dio.request(path,
          data: params, options: Options(
              method: _methodValues[method],
              headers: _headerToken()
          ));
      if (success != null) {
        success(response.data);
      }
    } on DioException catch (e) {
      final NetError netError = HttpException.handleException(e);
      _onError(netError.code, netError.msg, fail);
      debugPrint("Error=====>$e");
    }
  }

}
Map<String, dynamic>? _headerToken(){
  /// Tùy chỉnh Header, nếu cần thêm thông tin token vui lòng gọi tham số này
  // UserEntity? info = SpUtil.getUserInfo();
  // if(info == null){
  //   return null;
  // }
  // Map<String, dynamic> httpHeaders = {
  //   'Cookie': 'loginUserName=${info.username};loginUserPassword=${info.password}',
  // };
  // return httpHeaders;
}
Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = 'lỗi không xác định';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};