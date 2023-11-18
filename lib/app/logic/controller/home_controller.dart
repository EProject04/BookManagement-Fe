import 'dart:convert';

import 'package:frame/app/data/models/authors.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/category.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Books> books = RxList<Books>();
  RxList<Categories> categories = RxList<Categories>();
  RxList<Author> authors = RxList<Author>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBooks();
    getCategory();
    getAuthors();
  }

  Future<void> getBooks() async {
    try{
      isLoading(true);
      update();
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
    catch(e) {
      throw(e);// Notify GetX that the state has changed
    }
  }

  Future<void> getCategory() async {
    try{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var response = await NetWorkHandler.get(RequestApi.API_CATEGORIES_GET);
      List<dynamic> jsonData = json.decode(response);
      List<Categories> cateData =
      jsonData.map((dynamic category) => Categories.fromJson(category)).toList();
      categories.clear(); // Clear the existing list of books
      for (final cateData in cateData) {
        categories.add(cateData);
      }
      print(cateData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }

  }

  Future<void> getAuthors() async {
    try{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var response = await NetWorkHandler.get(RequestApi.API_AUTHORS_GET);
      List<dynamic> jsonData = json.decode(response);
      List<Author> authorData =
      jsonData.map((dynamic author) => Author.fromJson(author)).toList();
      authors.clear(); // Clear the existing list of books
      for (final authorData in authorData) {
        authors.add(authorData);
      }
      print(authorData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
