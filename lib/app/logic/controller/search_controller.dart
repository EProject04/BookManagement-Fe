import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SearchBookController extends GetxController{

  RxBool isLoading = false.obs;
  RxList<Books> listBookBySearch = <Books>[].obs;
  TextEditingController search = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> searchListBook(String keyword) async{
    isLoading(true);
    update(); // Notify GetX that the state has changed
    // Make an API call to fetch all books
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_BOOK_SEARCH}?keyword=$keyword');

    // var url = Uri.parse('${RequestApi.BaseUrl}${RequestApi.API_BOOK_SEARCH}?keyword=$keyword&CategoryName=$cateName&AuthorName=$authorName');
    var response = await http.get(
        url,
        headers: headers
    );

    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      var bookList = (jsonData['items'] as List).map((e) => Books.fromJson(e));
      listBookBySearch.assignAll(bookList);
      print(listBookBySearch);
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