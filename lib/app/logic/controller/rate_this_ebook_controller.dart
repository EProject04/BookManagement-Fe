import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/comment.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RateThisEbookController extends GetxController {

  TextEditingController commentText = TextEditingController();

  Future<void> createReview(int bookId, int commentRate) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString('id')!;
    String sessionCookie = preferences.getString('sessionCookie')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};
    var url = Uri.parse(RequestApi.BaseUrl + RequestApi.API_COMMENT_CREATE);
    Map body = {
      'commentText': commentText.text,
      'rate': commentRate,
      'bookId': bookId,
      'userId': int.parse(userId)
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Comment comment = Comment.fromJson(result);
      commentText.text = comment.commentText;
    } else {

      print('false');
    }
  }

  Future<void> updateReview(int commentId, int bookId, int commentRate ) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sessionCookie = preferences.getString('sessionCookie')!;
    String userId = preferences.getString('id')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};
    var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_FOLLOWING_UPDATE}$commentId');
    var response = await http.put(
        url,
        body: jsonEncode({
          'commentText': commentText.text,
          'rate': commentRate,
          'bookId': bookId,
          'userId': int.parse(userId),
          'id':commentId
        }),
        headers: headers
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Comment comment = Comment.fromJson(result);
      commentText.text = comment.commentText;
    } else {

      print('false');
    }
  }
}
