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

class HomePage extends GetView<MainWrapperController> {
  static final _pageInstance = HomePage._internal();
  factory HomePage() => _pageInstance;
  HomePage._internal();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                  color: Colors.black
                              )
                          ),
                        ),
                        Expanded(
                            child: Container()
                        ),
                        IconButton(
                            onPressed: (){
                              Get.to(SearchView());
                            },
                            icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.notifications_none)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Recommended For You",
                          style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),),
                        Expanded(
                          child: Container(),
                        ),
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.arrow_forward))
                      ],
                    ),
                    SizedBox(
                      height: 282,
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) => InkWell(
                          onTap: (){
                            Get.to(BookDetailScreenNew());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width*0.4,
                                  height: size.height*0.25,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://upload.wikimedia.org/wikibooks/vi/5/5e/B%C3%ACa_s%C3%A1ch_Harry_Potter_ph%E1%BA%A7n_1.jpg',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: size.width*0.4,
                                  child: Text('Harry Potter và hòn đá phù thuỷf',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Icon(
                                      size:20,
                                      Icons.star_half,
                                      color: Colors.grey,
                                    ),
                                    Text('4.9',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Explore by Genre",
                          style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),),

                      Expanded(
                          child: Container()
                      ),
                      IconButton(
                          onPressed: (){
                            Get.to(ExploreByGenreView());
                          },
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    child: ListOfGenre(),
                    // ListView.builder(
                    //   itemCount: 8,
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (context, index) => InkWell(
                    //     onTap: (){
                    //       Get.to(GenreDetailView());
                    //     },
                    //     child: Container(
                    //       margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    //       width: 150,
                    //       color: Colors.red,
                    //       child: Text("Genre"),),
                    //   ),),
                  ),
                  Row(
                    children: [
                      Text(
                        "Read History",
                        style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),),
                      Expanded(
                          child: Container()
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                  SizedBox(
                    height: 282,
                    child: ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) => InkWell(
                        onTap: (){
                          Get.to(BookDetailScreenNew());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width*0.4,
                                height: size.height*0.25,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://upload.wikimedia.org/wikibooks/vi/5/5e/B%C3%ACa_s%C3%A1ch_Harry_Potter_ph%E1%BA%A7n_1.jpg',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: size.width*0.4,
                                child: Text('Harry Potter và hòn đá phù thuỷf',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(
                                    size:20,
                                    Icons.star_half,
                                    color: Colors.grey,
                                  ),
                                  Text('4.9',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              )
          ),
        )
    );
  }
}

class BookGenre{
  final int id;
  final String genre;
  bool isSelected;
  BookGenre(this.id, this.genre, this.isSelected);
}



class ListOfGenre extends StatefulWidget {
  const ListOfGenre({super.key});

  @override
  State<ListOfGenre> createState() => _ListOfGenreState();
}

class _ListOfGenreState extends State<ListOfGenre> {

  List<BookGenre> bookGenre = <BookGenre>[];


  @override
  void initState(){
    super.initState();
    bookGenre.add(new BookGenre(1, 'Romance', false));
    bookGenre.add(new BookGenre(2, 'Fantasy', false));
    bookGenre.add(new BookGenre(3, 'Sci-Fi', false));
    bookGenre.add(new BookGenre(4, 'Horror', false));
    bookGenre.add(new BookGenre(5, 'Mystery', false));
    bookGenre.add(new BookGenre(6, 'Thriller', false));
    bookGenre.add(new BookGenre(7, 'Psychology', false));
    bookGenre.add(new BookGenre(8, 'Inspiration', false));
    bookGenre.add(new BookGenre(9, 'Comedy', false));
    bookGenre.add(new BookGenre(10, 'Action', false));
    bookGenre.add(new BookGenre(11, 'Adventure', false));
    bookGenre.add(new BookGenre(12, 'Comics', false));
    bookGenre.add(new BookGenre(13, 'Children\'s', false));
    bookGenre.add(new BookGenre(14, 'Art & Photography', false));
    bookGenre.add(new BookGenre(15, 'Food & Drink', false));
    bookGenre.add(new BookGenre(16, 'Biography', false));
    bookGenre.add(new BookGenre(17, 'Science & Technology', false));
    bookGenre.add(new BookGenre(18, 'Guide / How-to', false));
    bookGenre.add(new BookGenre(19, 'Travel', false));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: bookGenre.map(
                (item)=>InkWell(
              onTap:(){
                setState(() {
                  Get.to(()=>GenreDetailView());
                  // bookGenre.forEach((element) {
                  //
                  // });
                });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  width: size.width*0.35,
                  height: size.height*0.2,
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(item.genre,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1618588507085-c79565432917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fHww&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
    );
  }
}
