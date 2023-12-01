import 'package:frame/app/logic/controller/genre_controller.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController{
  final genreController = Get.put(GenreController());

  @override
  void onInit() {
    super.onInit();
  }
}