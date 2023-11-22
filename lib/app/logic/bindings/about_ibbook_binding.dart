import 'package:frame/app/logic/controller/about_ibbook_controller.dart';
import 'package:get/get.dart';

class AboutIbbookBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(AboutIbbookController());
  }
}