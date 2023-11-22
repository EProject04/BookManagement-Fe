import 'package:frame/app/logic/controller/wishlist_controller.dart';
import 'package:get/get.dart';

class WishlistBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(WishlistController());
  }
}