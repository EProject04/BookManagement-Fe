import 'package:frame/app/view/bookdetail/book_detail_new_view.dart';
import 'package:frame/app/view/explore_by_genre/explore_by_genre_view.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/app/view/login/login_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:frame/app/view/your_profile/your_profile_view.dart';
import 'package:get/get.dart';
abstract class Routes {

  static const String wellcomPage = '/welcome';
  static const String homePage = '/home';
  static const String loginPage = '/login';
  static const String confirmProfilePgae = '/confirmProfile';
  static const String registerPage = '/register';
  static const String userInforPage = '/userinfor';
  static const String explorGenrePage = '/genre';
  static const String bookDetailPage = '/bookdetail';

  static final routePage = [
    GetPage(
        name: wellcomPage,
        page: () =>  WellComeScreen(),),
    GetPage(
      name: homePage,
      page: () =>  HomePage(),),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),),
    GetPage(
      name: confirmProfilePgae,
      page: () =>  YourProfile(),),
    GetPage(
      name: userInforPage,
      page: () =>  WellComeScreen(),),
    GetPage(
      name: explorGenrePage,
      page: () =>  ExploreByGenreView(),),
    GetPage(
      name: bookDetailPage,
      page: () =>  BookDetailScreenNew(),

    ),


  ];

}