import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/controller/main_wrapper_controller.dart';
import 'package:frame/app/data/utils/themes.dart';
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
      themeMode: Get.put(MainWrapperController()).theme,
      title: 'ib Book App',
      home: WellComeScreen(),
    );
  }
}

