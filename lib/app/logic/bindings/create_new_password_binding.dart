import 'package:frame/app/view/creat_new_password/create_new_password_view.dart';
import 'package:get/get.dart';

class CreateNewPasswordBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(CreateNewPasswordController());
  }
}