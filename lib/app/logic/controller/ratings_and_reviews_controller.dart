import 'dart:convert';

import 'package:frame/app/data/models/comment.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class RatingsAndReviewsController extends GetxController{

  RxBool isLoading = false.obs;
  RxList<Comment> comments = <Comment>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> deleteComment(int id)async{
    isLoading(true);
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String sessionCookie = preferences.getString('sessionCookie')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_COMMENT_DELTETE_ID+id.toString());
    var response = await http.delete(
        url,
        headers: headers
    );
    if(response.statusCode == 200){

      print('delete comment successful');
      isLoading(false);
      update();
      refresh();
    }else{
      throw Exception('false to delete comment');
    }
    // await preferences.clear();

  }



  Future<void> getCommentsByUserId(int bookId) async{
    isLoading(true);
    update(); // Notify GetX that the state has changed
    // Make an API call to fetch all books
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sessionCookie = preferences.getString('sessionCookie')!;
    String userId = preferences.getString('id')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};

    var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_COMMENT_GET_USERID}?userId=$userId&bookId=$bookId');

    // var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_BOOK_SEARCH}?keyword=$keyword&CategoryName=$cateName&AuthorName=$authorName');
    var response = await http.get(
        url,
        headers: headers
    );

    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      var book = (jsonData['comments'] as List).map((e) => Comment.fromJson(e));
      comments.assignAll(book);
      print(comments);
      isLoading(false);
      update();
    }else{
      print('false');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}