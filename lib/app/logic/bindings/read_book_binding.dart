import 'package:frame/app/logic/controller/read_book_controller.dart';
import 'package:get/get.dart';

class ReadBookBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(ReadBookController());
  }
}