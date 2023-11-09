import 'package:frame/app/logic/controller/main_wrapper_controller.dart';
import 'package:get/get.dart';

class MainWrapperBinding implements Bindings {
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(MainWrapperController());
  }
}