import 'dart:convert';

import 'package:frame/app/data/models/authors.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/category.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/logic/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
HomeController homeController = HomeController();
class GenreController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<Author> authors = RxList<Author>();
  RxList<Books> bookByAuthor =  RxList<Books>();
  RxList bookByCategory =  [].obs;
  late Author author;
  late Categories categories;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAuthors();

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
   Future<void> getBookByAuthorName(String authorName) async{
    try{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var response = await NetWorkHandler.get(RequestApi.API_BOOK_SEARCH + '?AuthorName=' + '${authorName}');
      List<dynamic> jsonData = json.decode(response);
      List<Books> bookData =
      jsonData.map((dynamic book) => Books.fromJson(book)).toList();
      bookByAuthor.clear(); // Clear the existing list of books

      for (final bookData in bookData) {
        bookByAuthor.add(bookData);
      }
      print(bookData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }
  }

  Future<void> getBookByCategories(String cateName) async{
    try{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var response = await NetWorkHandler.get(RequestApi.API_BOOK_SEARCH + cateName);
      List<dynamic> jsonData = json.decode(response);
      List<Books> bookData =
      jsonData.map((dynamic book) => Books.fromJson(book)).toList();
      bookByCategory.clear(); // Clear the existing list of books
      bookByCategory = bookData as RxList;
      print(bookData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }
  }

 getAuthorbyId(dynamic id) async{
try{

  var response = await NetWorkHandler.get(RequestApi.API_AUTHORS_GET_ID + id.toString());
  Map<String, dynamic> authorData = jsonDecode(response);
  Author parsedAuthor = Author.fromJson(authorData);

  // Update the product state
  author = parsedAuthor;
  update();
}
catch(e){
  throw(e);
}
  }

  getCategoryId(dynamic id) async{
    try{

      var response = await NetWorkHandler.get(RequestApi.API_CATEGORIES_GET_ID + id);
      Map<String, dynamic> cateData = jsonDecode(response);
      Categories parsedCategory = Categories.fromJson(cateData);

      // Update the product state
      categories = parsedCategory ;
      update();
    }
    catch(e){
      throw(e);
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}