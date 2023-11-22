import 'package:frame/app/logic/controller/genre_controller.dart';
import 'package:get/get.dart';

class GenreBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(GenreController());
  }
}