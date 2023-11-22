import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    // Add your dependencies here
    Get.put(SearchController());
  }
}