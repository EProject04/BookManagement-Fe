import 'dart:convert';

import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Books> books = RxList<Books>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBooks();
  }

  Future<void> getBooks() async {
    isLoading(true);
    update(); // Notify GetX that the state has changed
    // Make an API call to fetch all books
    var response = await NetWorkHandler.get(RequestApi.API_BOOK_GET);
    List<dynamic> jsonData = json.decode(response);
    List<Books> booksData =
    jsonData.map((dynamic book) => Books.fromJson(book)).toList();
    books.clear(); // Clear the existing list of books
    for (final bookData in booksData) {
      books.add(bookData);
    }
    print(booksData);
    isLoading(false);
    update(); // Notify GetX that the state has changed
  }

  @override
  void dispose() {
    super.dispose();
  }
}
