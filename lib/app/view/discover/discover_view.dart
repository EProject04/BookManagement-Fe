import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:get/get.dart';
class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Image(
              image: NetworkImage('https://st3.depositphotos.com/11953928/32310/v/450/depositphotos_323108450-stock-illustration-isolated-books-flat-design.jpg'),
            ),
            backgroundColor: Colors.white,
            title: Text('Dicover',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ) ,
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: (){},
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text('Top Charts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,//bo padding
                        constraints: BoxConstraints(),//bo gioi han de can sat le
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.orange,
                        ),
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height *0.35,
                    child: ListView.separated(
                      itemCount: 8,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) => InkWell(
                        onTap: (){
                          Get.to(BookDetailScreenNew(),
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

                  //top new releases
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text('Top New Releases',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,//bo padding
                        constraints: BoxConstraints(),//bo gioi han de can sat le
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.orange,
                        ),
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height *0.35,
                    child: ListView.separated(
                      itemCount: 8,

                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) => InkWell(
                        onTap: (){
                          Get.to(BookDetailScreenNew(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 600));
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
                              child: Text('Harry Potter và hòn đá phù thuỷ',
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
            ),

          ),
        )

    );
  }
}

