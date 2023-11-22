import 'package:frame/app/logic/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(ForgetPasswordController());
  }
}