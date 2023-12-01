import 'dart:convert';

import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/followings.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class WishlistController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<BooksFollow> listBookByFollowing = <BooksFollow>[].obs;
  late Books books;
  RxInt followId = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getAllFollowing();
    super.onInit();

  }
  Future<void> getAllFollowing()async{
    isLoading(true);
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sessionCookie = preferences.getString('sessionCookie')!;
    var headers = {'Content-Type': 'application/json', 'Cookie': sessionCookie};

    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_GET_ALL_FOLLOWING);
    var response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      followId.value = result[0]['id'];
      var bookList = (result[0]['books'] as List).map((e) => BooksFollow.fromJson(e));
      listBookByFollowing.assignAll(bookList);
      print(listBookByFollowing);
      print('success');
      isLoading(false);
      update();
    }else{
      throw Exception('false');
    }
    // await preferences.clear();
  }



  Future<void> getBookById(int id)async{
    isLoading(true);
    update();
    var headers = {'Content-Type': 'application/json',};
    var url = Uri.parse(RequestApi.BaseUrl+RequestApi.API_BOOK_GET_ID+id.toString());
    var response = await http.get(
        url,
        headers: headers
    );
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);

      Books book = Books.fromJson(result);
      print('success');
      Get.to(()=>BookDetailScreenNew(),
          arguments: book
      );
      isLoading(false);
      update();
    }else{
      throw Exception('false');
    }
    // await preferences.clear();

  }

}