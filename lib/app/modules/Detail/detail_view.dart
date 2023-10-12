import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class Book{
  final int id;
  final String title;
  final String description;
  final String content;
  final String status;
  final String imagePath;
  final String author;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.status,
    required this.imagePath,
    required this.author
  });
}

class Controller extends GetxController{

}

class DetailPage extends StatelessWidget {
  static final _pageInstance = DetailPage._internal();
  factory DetailPage() => _pageInstance;
  DetailPage._internal();
  late Book bookDetail;

  final pageController = Controller();
  @override
  void initState(){
    bookDetail = Book(
        id: 1,
        content: "",
        description: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        title: "Ta muốn trở thành chúa tể bóng tối",
        status: "",
        imagePath: "https://product.hstatic.net/200000343865/product/1---lmt_c6192d87264a4ed8b015befdb10e4379_master.jpg",
        author: "J.K. Rowling"
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_back)),
                    Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.add_circle_outline_rounded)),
                        )
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(13, 0, 13, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 212,
                        width: 150,
                        child: Container(
                          child: Image.network(bookDetail.imagePath),
                        ),
                      ),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookDetail.title,
                                  style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      )
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                  child: Text(
                                    bookDetail.author,
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(248, 147, 0, 1)
                                        )
                                    ),
                                  ),
                                ),
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
                                Row(
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
                                    )
                                  ],
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),),
                                Text(
                                  "View",
                                  style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(100, 100, 100, 1),
                                          fontSize: 10,
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
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(Icons.star),))
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
                          margin: EdgeInsets.fromLTRB(13, 10, 13, 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(248, 147, 0, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                )
                            ),
                            onPressed: (){},
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
                  margin: EdgeInsets.fromLTRB(13, 10, 13, 10),
                  child: Column(
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
                                    onPressed: null,
                                    icon: Icon(Icons.arrow_forward)),
                              )
                          )
                        ],
                      ),
                      Text(
                        bookDetail.description,
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
                        height: 282,
                        child: ListView.builder(
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: 150,
                            color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  height: 212,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "The House of Hades (Heroes of Olympus) and the",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      )),)],),),),
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
                        height: 282,
                        child: ListView.builder(
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: 150,
                            color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  height: 212,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "The House of Hades (Heroes of Olympus) and the",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      )),)],),),),
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
