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

  Book({required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.status,
    required this.imagePath});
}

class Controller extends GetxController{
  static final _controllerInstance = Controller._internal();
  factory Controller() => _controllerInstance;
  Controller._internal();
  late Book bookDetail;

  Future<void> fetchBook() async{
    await Future.delayed(const Duration(seconds: 1));
    bookDetail = Book(id: 1,
        content: "",
        description: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
        title: "Ta muốn trở thành chúa tể bóng tối",
        status: "",
        imagePath: "https://product.hstatic.net/200000343865/product/1---lmt_c6192d87264a4ed8b015befdb10e4379_master.jpg");

  }
}

class HomePage extends StatelessWidget {
  static final _pageInstance = HomePage._internal();
  factory HomePage() => _pageInstance;
  HomePage._internal();

  final pageController = Controller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: pageController.fetchBook(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Container();
              }
              else {
                return SingleChildScrollView(
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
                                  onPressed: null,
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
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
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
                                  onPressed: null,
                                  icon: Icon(Icons.arrow_forward))
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              itemCount: 8,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 150,
                                color: Colors.red,
                                child: Text("Genre"),),),
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
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
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
                );
              }
            },
          )
        )
    );
  }
}
