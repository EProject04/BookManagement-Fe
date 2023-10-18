import 'package:flutter/material.dart';
import 'package:frame/app/view/explore_by_genre/explore_by_genre_view.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static final _pageInstance = HomePage._internal();
  factory HomePage() => _pageInstance;
  HomePage._internal();

  @override
  Widget build(BuildContext context) {
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreByGenreView()));
                          },
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
          )
        )
    );
  }
}
