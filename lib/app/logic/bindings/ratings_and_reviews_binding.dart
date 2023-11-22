import 'package:frame/app/logic/controller/ratings_and_reviews_controller.dart';
import 'package:get/get.dart';

class RatingsAndReviewsBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(RatingsAndReviewsController());
  }
}