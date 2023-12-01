
import 'package:frame/app/logic/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(SearchBookController());
  }
}