import 'package:frame/app/logic/controller/rate_this_ebook_controller.dart';
import 'package:get/get.dart';

class RateThisEbookBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(RateThisEbookController());
  }
}