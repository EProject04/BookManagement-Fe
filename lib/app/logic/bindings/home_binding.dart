import 'package:frame/app/logic/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(HomeController());
  }
}