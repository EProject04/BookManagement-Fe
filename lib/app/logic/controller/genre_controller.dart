import 'dart:convert';

import 'package:frame/app/data/models/authors.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';

class GenreController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<Author> authors = RxList<Author>();

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
  @override
  void dispose() {
    super.dispose();
  }
}