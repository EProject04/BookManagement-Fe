import 'package:frame/app/logic/controller/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(AccountController());
  }
}