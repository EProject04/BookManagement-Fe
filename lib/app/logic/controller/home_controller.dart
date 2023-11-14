import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/services/network_handler.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
RxBool isLoading = false.obs;
 late List<Books> _listBooks =[];

@override
void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

 void fecthBooks (){
    var response = NetWorkHandler.get(RequestApi.API_BOOK_GET);
    
 }

@override
void dispose() {
 super.dispose();
}
}