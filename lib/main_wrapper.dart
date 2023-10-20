import 'package:flutter/material.dart';
import 'package:frame/app/data/utils/colors.dart';
import 'package:frame/app/logic/controller/main_wrapper_controller.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';



class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final MainWrapperController _mainWrapperController =
  Get.find<MainWrapperController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "ibBOOK APP",
      //     style: Theme.of(context).textTheme.subtitle1,
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Obx(
      //           () => Switch.adaptive(
      //         value: _mainWrapperController.isDarkTheme.value,
      //         onChanged: (newVal) {
      //           _mainWrapperController.isDarkTheme.value = newVal;
      //           _mainWrapperController
      //               .switchTheme(newVal ? ThemeMode.dark : ThemeMode.light);
      //         },
      //       ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  icon: IconlyLight.home,
                  page: 0,
                  context,
                  label: "Home",
                ),
                _bottomAppBarItem(
                    icon: IconlyLight.discovery,
                    page: 1,
                    context,
                    label: "Discover"),
                _bottomAppBarItem(
                    icon: IconlyLight.bookmark,
                    page: 2,
                    context,
                    label: "Wishlist"),
                _bottomAppBarItem(
                    icon: IconlyLight.profile,
                    page: 3,
                    context,
                    label: "Account"),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _mainWrapperController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _mainWrapperController.animateToTab,
        children: [..._mainWrapperController.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => _mainWrapperController.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _mainWrapperController.currentPage == page
                  ? ColorConstants.appColors
                  : Colors.grey,
              size: 20,
            ),
            Text(
              label,
              style: TextStyle(
                  color: _mainWrapperController.currentPage == page
                      ? ColorConstants.appColors
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight: _mainWrapperController.currentPage == page
                      ? FontWeight.w600
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}