import 'package:frame/app/logic/controller/help_center_controller.dart';
import 'package:get/get.dart';

class HelpCenterBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(HelpCenterController());
  }
}