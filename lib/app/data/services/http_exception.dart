import 'dart:io';

import 'package:dio/dio.dart';

class HttpException {
  static const int success = 200;
  static const int successNotContent = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;

  static const netError = 1000;
  static const int parseError = 1001;
  static const int socketError = 1002;
  static const int httpError = 1003;
    static const int timeoutError = 1004;
  static const int cancelError = 1005;
  static const int unknownError = 9999;

  static NetError handleException(DioException error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError) {
        dynamic e = error.message;
        if (e is SocketException) {
          return NetError(socketError, 'Lỗi kết nối mạng！');
        }
        if (e is HttpException) {
          return NetError(httpError, 'Yêu cầu HTTP không hợp lệ.！');
        }
        if (e is FormatException) {
          return NetError(parseError, 'Lỗi phân tích dữ liệu！');
        }
        return NetError(netError, 'Mạng không có kết nối internet！');
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return NetError(timeoutError, 'Máy chủ quá tải.！');
      } else if (error.type == DioExceptionType.cancel) {
        return NetError(cancelError, 'Lỗi hủy yêu cầu');
      } else {
        return NetError(unknownError, 'Lỗi không xác định');
      }
    } else {
      return NetError(unknownError, 'Lỗi không xác định');
    }
  }
}

class NetError {
  int code;
  String msg;

  NetError(this.code, this.msg);
}