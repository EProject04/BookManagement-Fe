import 'package:flutter/material.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/app/view/login/login_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:get/get.dart';





class MainWrapperController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;

  List<Widget> pages = [
    HomePage(),
    BookDetailPage(),
     WellComeScreen(),
     LoginPage(),
  ];

  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}