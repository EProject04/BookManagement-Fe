import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/utils/themes.dart';
import 'package:frame/app/logic/controller/main_wrapper_controller.dart';
import 'package:frame/app/routes/routes.dart';
import 'package:frame/app/view/account/account_view.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:frame/app/view/create_new_account/create_new_account.dart';
import 'package:frame/app/view/discover/discover_view.dart';
import 'package:frame/app/view/explore_by_genre/explore_by_genre_view.dart';
import 'package:frame/app/view/genre_detail/genre_detail_view.dart';
import 'package:frame/app/view/help_center/help_center_view.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/app/view/login/login_view.dart';
import 'package:frame/app/view/personal_info/personal_info_view.dart';
import 'package:frame/app/view/search/search_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:frame/app/view/wishlist/wishlist_view.dart';
import 'package:frame/app/view/your_profile/your_profile_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();

  // runApp(DevicePreview(builder: (context) => MyApp(),));
   runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool status = true;
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    status = preferences.getBool('isLoggedIn')??false;
  }
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      getPages: Routes.routePage,
      initialRoute: '/',
      themeMode: Get.put(MainWrapperController()).theme,
      title: 'ib Book App',
      home: status == true?MainWrapper():WellComeScreen(),
    );
  }
}



