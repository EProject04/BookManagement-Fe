import 'package:frame/app/logic/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(ProfileController());
  }
}