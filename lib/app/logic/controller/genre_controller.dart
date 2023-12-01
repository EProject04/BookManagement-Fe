import 'dart:convert';

import 'package:frame/app/data/models/authors.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/category.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GenreController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<Author> authors = RxList<Author>();
  RxList<Categories> categories = RxList<Categories>();
  // RxList<Books> bookByAuthor =  RxList<Books>();
  // RxList bookByCategory =  [].obs;
  // late Author author;
  // late Categories categories;
  RxList<Books> listBookByAuthor = <Books>[].obs;
  RxList<Books> listBookByCate = <Books>[].obs;
  RxList<Categories> listCate = <Categories>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getAuthors();
    getCate();
    super.onInit();

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
      // print(authorData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }
  }

  Future<void> getCate() async {
    try{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var response = await NetWorkHandler.get(RequestApi.API_CATEGORIES_GET);
      List<dynamic> jsonData = json.decode(response);
      List<Categories> cateData =
      jsonData.map((dynamic cate) => Categories.fromJson(cate)).toList();
      categories.clear(); // Clear the existing list of books
      for (final cateData in cateData) {
        categories.add(cateData);
      }
      // print(authorData);
      isLoading(false);
      update(); // Notify GetX that the state has changed
    }catch(e){
      throw(e);
    }
  }



   Future<void> getBookByAuthorName(String authorName) async{
      isLoading(true);
      update(); // Notify GetX that the state has changed
      // Make an API call to fetch all books
      var headers = {
        'Content-Type': 'application/json'
      };
      var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_BOOK_SEARCH + '?AuthorName=' + '${authorName}');
      var response = await http.get(
          url,
          headers: headers
      );

      if(response.statusCode == 200){
        var jsonData = json.decode(response.body);
        var bookList = (jsonData['items'] as List).map((e) => Books.fromJson(e));
        print(bookList);
        listBookByAuthor.assignAll(bookList);
        print(listBookByAuthor);
        isLoading(false);
        update();
      }else{

        print('false');
      }
      // Notify GetX that the state has changed

  }

  Future<void> getBookByCateName(String cateName) async{
    isLoading(true);
    update(); // Notify GetX that the state has changed
    // Make an API call to fetch all books
    var headers = {
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_BOOK_SEARCH + '?CategoryName=' + '${cateName}');
    var response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      var listBook = (jsonData['items'] as List).map((e) => Books.fromJson(e));
      var listCates = (jsonData['items']['categoriesBook'] as List).map((e) => Categories.fromJson(e));
      listBookByCate.assignAll(listBook);
      listCate.assignAll(listCates);
      print(listBookByCate);
      isLoading(false);
      update();

    }else{

      print('false');
    }
    // Notify GetX that the state has changed

  }

  //  Future<void> getBookByAuthorName(String authorName) async{
  //   try{
  //     isLoading(true);
  //     update(); // Notify GetX that the state has changed
  //     // Make an API call to fetch all books
  //     var response = await NetWorkHandler.get(RequestApi.API_BOOK_SEARCH + '?AuthorName=' + '${authorName}');
  //     List<dynamic> jsonData = json.decode(response);
  //     List<Books> bookData =
  //     jsonData.map((dynamic book) => Books.fromJson(book)).toList();
  //     bookByAuthor.clear(); // Clear the existing list of books
  //
  //     for (final bookData in bookData) {
  //       bookByAuthor.add(bookData);
  //     }
  //     print(bookData);
  //     isLoading(false);
  //     update(); // Notify GetX that the state has changed
  //   }catch(e){
  //     throw(e);
  //   }
  // }

  // Future<void> getBookByCategories(String cateName) async{
  //   try{
  //     isLoading(true);
  //     update(); // Notify GetX that the state has changed
  //     // Make an API call to fetch all books
  //     var response = await NetWorkHandler.get(RequestApi.API_BOOK_SEARCH + cateName);
  //     List<dynamic> jsonData = json.decode(response);
  //     List<Books> bookData =
  //     jsonData.map((dynamic book) => Books.fromJson(book)).toList();
  //     bookByCategory.clear(); // Clear the existing list of books
  //     bookByCategory = bookData as RxList;
  //     print(bookData);
  //     isLoading(false);
  //     update(); // Notify GetX that the state has changed
  //   }catch(e){
  //     throw(e);
  //   }
  // }

//  getAuthorbyId(dynamic id) async{
// try{
//
//   var response = await NetWorkHandler.get(RequestApi.API_AUTHORS_GET_ID + id.toString());
//   Map<String, dynamic> authorData = jsonDecode(response);
//   Author parsedAuthor = Author.fromJson(authorData);
//
//   // Update the product state
//   author = parsedAuthor;
//   update();
// }
// catch(e){
//   throw(e);
// }
//   }

  // getCategoryId(dynamic id) async{
  //   try{
  //
  //     var response = await NetWorkHandler.get(RequestApi.API_CATEGORIES_GET_ID + id);
  //     Map<String, dynamic> cateData = jsonDecode(response);
  //     Categories parsedCategory = Categories.fromJson(cateData);
  //
  //     // Update the product state
  //     categories = parsedCategory ;
  //     update();
  //   }
  //   catch(e){
  //     throw(e);
  //   }
  // }


  @override
  void dispose() {
    super.dispose();
  }
}