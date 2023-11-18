import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/logic/controller/home_controller.dart';
import 'package:frame/app/logic/controller/main_wrapper_controller.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:frame/app/view/explore_by_genre/explore_by_genre_view.dart';
import 'package:frame/app/view/genre_detail/genre_detail_view.dart';
import 'package:frame/app/view/search/search_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends GetView<HomeController> {
  static final _pageInstance = HomePage._internal();
  factory HomePage() => _pageInstance;
  HomePage._internal();
  final carouselController = CarouselController();
  var bookListController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Book",
                          style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {
                              Get.to(() => SearchView());
                            },
                            icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications_none)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSliderWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Explore by Author",
                          style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {
                              Get.to(() => ExploreByGenreView());
                            },
                            icon: Icon(Icons.arrow_forward))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: ListOfAuthor(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Books For You",
                        style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: size.height * 0.35,
                      child: Obx(
                        () => bookListController.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ))
                            : GridView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                600
                                            ? (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3) /
                                                (180 * 1.6)
                                            : (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.27) /
                                                (180 * 1.7),
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                itemCount: bookListController.books.length,
                                // scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  final book = bookListController.books[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => BookDetailScreenNew(),
                                          transition: Transition.rightToLeft,
                                          duration:
                                              Duration(milliseconds: 600));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * 0.4,
                                          height: size.height * 0.25,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                'https://upload.wikimedia.org/wikibooks/vi/5/5e/B%C3%ACa_s%C3%A1ch_Harry_Potter_ph%E1%BA%A7n_1.jpg',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: size.width * 0.4,
                                          child: Text(
                                            '${book.title}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFeatures: [
                                                  FontFeature
                                                      .proportionalFigures(),
                                                ],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              size: 20,
                                              Icons.star_half,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              '4.9',
                                              style: TextStyle(
                                                fontFeatures: [
                                                  FontFeature
                                                      .proportionalFigures(),
                                                ],
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  var cateListController = Get.put(HomeController());
  int activateIndex = 0;
  final carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => cateListController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ))
              : CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: cateListController.categories.length,
                  itemBuilder: (context, index, realIndex) {
                    final cate = cateListController.categories[index];
                    return Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Text('${cate.categoryName}'),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    // reverse: true,
                    // enlargeCenterPage: true,
                    // enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 1,
                    autoPlayInterval: Duration(seconds: 10),
                    onPageChanged: (index, reason) {
                      setState(() {
                        activateIndex = index;
                      });
                    },
                  ),
                ),
        ),
        const SizedBox(height: 8),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activateIndex,
        count: cateListController.categories.length,
        onDotClicked: animateToSlide,
        effect: ScaleEffect(
          activeDotColor: Colors.blueAccent,
          dotColor: Colors.black12,
          dotWidth: 10,
          dotHeight: 10,
        ),
      );
  void animateToSlide(int index) => carouselController.animateToPage(index);
}

class ListOfAuthor extends StatefulWidget {
  const ListOfAuthor({super.key});

  @override
  State<ListOfAuthor> createState() => _ListOfAuthoreState();
}

class _ListOfAuthoreState extends State<ListOfAuthor> {
  var authorListController = Get.put(HomeController());
  final carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() =>  authorListController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Container(
      height: size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: authorListController.authors.length,
        itemBuilder: (context, index) {
          final author = authorListController.authors[index];
          return InkWell(
            onTap: (){
              Get.to(GenreDetailView());
            },
            child: Container(
              width: size.width*0.35,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  author.authorName.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 0.5,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://st3.depositphotos.com/11953928/32310/v/450/depositphotos_323108450-stock-illustration-isolated-books-flat-design.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    )
    );

  }
}
