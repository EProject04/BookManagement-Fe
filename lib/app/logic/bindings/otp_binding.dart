import 'package:frame/app/logic/controller/otp_controller.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(OtpController());
  }
}