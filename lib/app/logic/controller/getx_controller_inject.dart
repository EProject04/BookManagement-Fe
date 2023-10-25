import 'package:frame/app/data/services/request_repository.dart';
import 'package:get/get.dart';

class BaseGetController extends GetxController{

  late RequestRepository request;

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}

