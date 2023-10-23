import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/utils/themes.dart';
import 'package:frame/app/logic/controller/main_wrapper_controller.dart';
import 'package:frame/app/routes/routes.dart';
import 'package:frame/app/view/account/account_view.dart';
import 'package:frame/app/view/help_center/help_center_view.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(DevicePreview(builder: (context) => MyApp(),));
  //runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      getPages: Routes.routePage,
      initialRoute: '/',
      themeMode: Get.put(MainWrapperController()).theme,
      title: 'ib Book App',
      home: WellComeScreen(),
    );
  }
}

