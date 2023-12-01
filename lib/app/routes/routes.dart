import 'package:frame/app/logic/bindings/account_binding.dart';
import 'package:frame/app/logic/bindings/login_binding.dart';

import 'package:frame/app/logic/bindings/profile_binding.dart';
import 'package:frame/app/logic/bindings/register_binding.dart';
import 'package:frame/app/view/about_ibbook/about_ibbook_view.dart';
import 'package:frame/app/view/about_this_ebook/about_this_ebook_view.dart';
import 'package:frame/app/view/account/account_view.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:frame/app/view/creat_new_password/create_new_password_view.dart';
import 'package:frame/app/view/create_new_account/create_new_account.dart';
import 'package:frame/app/view/discover/discover_view.dart';
import 'package:frame/app/view/explore_by_genre/explore_by_genre_view.dart';
import 'package:frame/app/view/forget_password/forget_password_view.dart';
import 'package:frame/app/view/genre_detail/genre_detail_view.dart';
import 'package:frame/app/view/help_center/help_center_view.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/app/view/login/login_view.dart';
import 'package:frame/app/view/otp/otp_view.dart';
import 'package:frame/app/view/personal_info/personal_info_view.dart';
import 'package:frame/app/view/rate_this_ebook/rate_view.dart';
import 'package:frame/app/view/ratings_and_reviews/ratings_and_reviews_view.dart';
import 'package:frame/app/view/read_book/read_book_view.dart';
import 'package:frame/app/view/search/search_view.dart';
import 'package:frame/app/view/wellcome/wellcome_view.dart';
import 'package:frame/app/view/wishlist/wishlist_view.dart';
import 'package:frame/app/view/your_profile/your_profile_view.dart';
import 'package:get/get.dart';
abstract class Routes {
  static const String aboutIbBookPage = '/aboutIbBook';
  static const String aboutThisEbookPage = '/aboutThisEbook';
  static const String bookDetailPage = '/bookdetail';
  static const String newPasswordPage = '/newpassword';
  static const String newAccountPage ='/newaccount';
  static const String discoverPage = '/discover';
  static const String explorGenrePage = '/genre';
  static const String forgetPasswordPage = '/forgetpassword';
  static const String genreDetailPage = '/genredetail';
  static const String helpCenterPage = '/helpcenter';
  static const String homePage = '/home';
  static const String loginPage = '/login';
  static const String otpPage = '/opt';
  static const String personalInfoPage = '/personalinfo';
  static const String ratePage = '/rate';
  static const String ratingsAndReviewPage = '/ratingsandreviews';
  static const String readBookPage = '/readbook';
  static const String searchPage = '/search';
  static const String welcomePage = '/welcome';
  static const String confirmProfilePgae = '/confirmProfile';
  static const String registerPage = '/register';
  static const String accountPage = '/account';



  static const String wishListPage = '/wishlist';

  static final routePage = [
    GetPage(
      name: aboutThisEbookPage,
      page: () =>  AboutThisEbookView(),),
    GetPage(
      name: searchPage,
      page: () =>  SearchView(),),
    GetPage(
      name: readBookPage,
      page: () =>  ReadBookView(),),
    GetPage(
      name: ratingsAndReviewPage,
      page: () =>  RatingsAndReviewsView(),),
    GetPage(
      name: ratePage,
      page: () =>  RateView(),),
    GetPage(
      name: personalInfoPage,
      page: () =>  PersonalInfoView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: otpPage,
      page: () =>  OTPPage(),),
    GetPage(
      name: helpCenterPage,
      page: () =>  HelpCenterView(),),
    GetPage(
      name: genreDetailPage,
      page: () =>  GenreDetailView(),),
    GetPage(
      name: forgetPasswordPage,
      page: () =>  ForgetPasswordPage(),),

    GetPage(
      name: newPasswordPage,
      page: () =>  CreateNewPasswordPage(),),

    GetPage(
      name: aboutIbBookPage,
      page: () =>  AboutIbBookView(),),
    GetPage(
        name: welcomePage,
        page: () =>  WellComeScreen(),),
    GetPage(
      name: homePage,
      page: () =>  HomePage(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: confirmProfilePgae,
      page: () =>  YourProfile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: accountPage,
      page: () =>  AccountView(),
      bindings: [
        AccountBinding(),
        ProfileBinding(),
      ]
    ),

    GetPage(
      name: explorGenrePage,
      page: () =>  ExploreByGenreView(),),
    GetPage(
      name: bookDetailPage,
      page: () =>  BookDetailScreenNew(),),
    GetPage(
      name: discoverPage,
      page: () =>  DiscoverView(),),
    GetPage(
      name: wishListPage,
      page: () =>  WishlistView(),),
    GetPage(
      name: registerPage,
      page: () =>  CreateAccount(),
      binding: RegisterBinding(),
    ),
  ];

}