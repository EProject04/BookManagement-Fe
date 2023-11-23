import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/logic/controller/book_detail_controller.dart';
import 'package:frame/app/logic/controller/home_controller.dart';
import 'package:frame/app/view/about_this_ebook/about_this_ebook_view.dart';
import 'package:frame/app/view/rate_this_ebook/rate_view.dart';
import 'package:frame/app/view/ratings_and_reviews/ratings_and_reviews.dart';
import 'package:frame/app/view/read_book/read_book_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail{
  String content;
  String description;
  String title;
  bool status;
  String imagePath;

  BookDetail(
      this.content, this.description, this.title, this.status, this.imagePath);
}

class BookDetailScreenNew extends GetView<BookDetailController> {
  // const BookDetailScreenNew({super.key});
  static final _pageInstance = BookDetailScreenNew._internal();
  factory BookDetailScreenNew() => _pageInstance;
  BookDetailScreenNew._internal();

  final bookDetailController = HomeController();
  @override
  Widget build(BuildContext context) {

    // var bookDetail;
    String title = Get.arguments[0];
    String description = Get.arguments[1];
    String content = Get.arguments[2];
    String imagePath = Get.arguments[3];
    // int id = Get.arguments[4];
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Book Detail',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_circle_outline_rounded)),
            ],
            ),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 212,
                          width: 150,
                          child: Container(
                            child: Image.network(imagePath),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                        )
                                    ),
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                  //   child: Text(
                                  //     bookDetail.author,
                                  //     style: GoogleFonts.urbanist(
                                  //         textStyle: TextStyle(
                                  //             fontSize: 15,
                                  //             fontWeight: FontWeight.w600,
                                  //             color: Color.fromRGBO(248, 147, 0, 1)
                                  //         )
                                  //     ),
                                  //   ),
                                  // ),
                                  Text(
                                    "Release date",
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(50, 50, 50, 1)
                                        )
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 10, 5, 5),
                                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                          color: Color.fromRGBO(230, 230, 230, 1),
                                          child: Text(
                                            "Fantasy",
                                            style: GoogleFonts.urbanist(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(50, 50, 50, 1)
                                                )
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 10, 5, 5),
                                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                          color: Color.fromRGBO(230, 230, 230, 1),
                                          child: Text(
                                            "Fantasy",
                                            style: GoogleFonts.urbanist(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(50, 50, 50, 1)
                                                )
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 10, 5, 5),
                                          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                          color: Color.fromRGBO(230, 230, 230, 1),
                                          child: Text(
                                            "Fantasy",
                                            style: GoogleFonts.urbanist(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(50, 50, 50, 1)
                                                )
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(100, 100, 100, 1)
                                      )
                                  )
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "2371",
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),),
                                  Text(
                                    "View",
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            color: Color.fromRGBO(100, 100, 100, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                        )
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "4.9",
                                            style: GoogleFonts.urbanist(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.star, color: Colors.orangeAccent,size: 20,),))
                                  ],
                                ),
                                Text(
                                  "6.8k reviews",
                                  style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(100, 100, 100, 1)
                                      )
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(248, 147, 0, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  )
                              ),
                              onPressed: (){
                                Get.to(()=>ReadBookView(),
                                  arguments: [
                                    title,
                                    description,
                                    content,
                                    imagePath,

                                  ]
                                );
                              },
                              child: Text(
                                "Read",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    )
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "About this novel",
                              style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  )
                              ),
                            ),
                            Expanded(
                                child:Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: (){
                                        Get.to(()=>AboutThisEbookView());
                                      },
                                      icon: Icon(Icons.arrow_forward)),
                                )
                            )
                          ],
                        ),

                        Text(
                          description,
                          style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              )
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Ratings & Reviews",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    )
                                ),
                              ),
                            ),
                            Expanded(
                                child:Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: (){
                                        Get.to(()=> RatingsAndReviewsView());
                                      },
                                      icon: Icon(Icons.arrow_forward)),
                                )
                            )
                          ],
                        ),
                        IntrinsicHeight( // wrap it to show vertical divider
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width*0.4,
                                height: size.height*0.18,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('4.9',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      initialRating: 5,
                                      minRating: 1,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 15,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(height: 5,),
                                    Text('(6.8k reviews)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                // color: Colors.cyanAccent,
                                width: size.width*0.4,
                                height: size.height*0.18,
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context,index) => Container
                                    (
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                            child: Text("${index+1}")
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: SliderTheme(
                                            data: SliderTheme.of(context).copyWith(
                                              overlayShape: SliderComponentShape.noThumb,
                                              thumbShape: RoundSliderThumbShape(
                                                  enabledThumbRadius: 0.0
                                              ), // set the thumb shape to 0.0 radius
                                            ),
                                            child: Slider(
                                              activeColor: Colors.orange,
                                              value: 50,
                                              onChanged: (double newValue) {
                                              },
                                              min: 0,
                                              max: 100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Divider(thickness: 1,color: Colors.grey[300]),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Rate this Ebook",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: RatingBar.builder(

                            initialRating: 3,
                            minRating: 1,
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.orange,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        SizedBox(height: 5,),
                        Center(
                          child: ElevatedButton(onPressed: (){
                            Get.to(()=>RateView());
                          },
                              child: Text('Read a Review',
                                style: TextStyle(color: Colors.orange),
                              ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0.0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.orange)
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                "Author other books",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),),
                            ),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                                  child: IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.arrow_forward)),)
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height *0.35,
                          child: ListView.separated(
                            itemCount: 8,
                            padding: EdgeInsets.only(right: 15),
                            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15,),
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context, index) => InkWell(
                              onTap: (){
                                Get.to(()=>BookDetailScreenNew(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(milliseconds: 600)
                                );
                              },
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
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                "Similar books",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),),
                            ),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                                  child: IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.arrow_forward)),)
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height*0.35,
                          child: ListView.separated(
                            itemCount: 8,
                            padding: EdgeInsets.only(right: 15),
                            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15,),
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context, index) => InkWell(
                              onTap: (){
                                Get.to(()=>BookDetailScreenNew(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(milliseconds: 600)
                                );
                              },
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
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
