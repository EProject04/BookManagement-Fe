import 'package:frame/app/logic/controller/discover_controller.dart';
import 'package:get/get.dart';

class DiscoverBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(DiscoverController());
  }
}