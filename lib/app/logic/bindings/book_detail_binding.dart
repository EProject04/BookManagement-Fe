import 'package:get/get.dart';

class BookDetailBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(BookDetailBinding());
  }
}