import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/comment.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/logic/controller/wishlist_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookDetailController extends GetxController{

  WishlistController wishlistController = Get.put(WishlistController());
  RxBool isLoading = false.obs;
  RxList<Books> listBookByAuthorId = <Books>[].obs;


  @override
  void onInit() {

    super.onInit();

  }


  Future<void> booksByAuthorId(int id) async{
    isLoading(true);
    update(); // Notify GetX that the state has changed
    // Make an API call to fetch all books
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_BOOK_SEARCH}?AuthorID=$id');

    // var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_BOOK_SEARCH}?keyword=$keyword&CategoryName=$cateName&AuthorName=$authorName');
    var response = await http.get(
        url,
        headers: headers
    );

    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      var bookList = (jsonData['items'] as List).map((e) => Books.fromJson(e));
      listBookByAuthorId.assignAll(bookList);
      print(listBookByAuthorId);
      isLoading(false);
      update();
    }else{
      print('false');
    }
  }
  Future<void> updateBookFollowing(int bookId) async{
    isLoading(true);
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sessionCookie = preferences.getString('sessionCookie')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_FOLLOWING_UPDATE);
    var response = await http.put(
        url,
        body: jsonEncode({
          'id': wishlistController.followId.value,
          'bookId':bookId,
        }),
        headers: headers
    );
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      print(result);
      print('success');

    }else{
      throw Exception('false');
    }
    isLoading(false);
    update();
  }


}

