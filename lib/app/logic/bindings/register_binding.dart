import 'package:frame/app/logic/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(() => RegisterController());
  }
}
