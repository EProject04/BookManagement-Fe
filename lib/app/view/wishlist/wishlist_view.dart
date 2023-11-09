import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:frame/app/view/read_book/read_book_view.dart';
import 'package:get/get.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          leading:Image(
            image: NetworkImage('https://st3.depositphotos.com/11953928/32310/v/450/depositphotos_323108450-stock-illustration-isolated-books-flat-design.jpg'),
          ),
          elevation: 0.0,// remove app bar shadow
          backgroundColor: Colors.white,
          title: Text('Wishlist',
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
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.filter_list,

              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20,20,0,20),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context,index) =>Container(
              padding: EdgeInsets.only(bottom: 20),
              height: size.height * 0.15,
              // color: Colors.amber[600],
              child: InkWell(
                onTap: (){
                  Get.to(()=>BookDetailScreenNew());
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.27,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://m.media-amazon.com/images/I/61fqa1gbE5L._AC_UF1000,1000_QL80_.jpg'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Reign of Blood',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
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
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    Container(
                      child: PopupMenuButton<int>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                        ),

                        itemBuilder: (context) =>[
                          PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.bookmark_remove_outlined),
                                  SizedBox(width: 10,),
                                  Text('Remove')
                                ],
                              )
                          ),
                          // PopupMenuItem(
                          //     value: 2,
                          //     child:  Row(
                          //       children: [
                          //         Icon(Icons.share),
                          //         SizedBox(width: 10,),
                          //         Text('Share')
                          //       ],
                          //     )
                          // ),
                          PopupMenuItem(
                            value: 3,
                            child:  Row(
                              children: [
                                Icon(Icons.info_outline_rounded),
                                SizedBox(width: 10,),
                                Text('About this eBook')
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          // Perform your actions based on the selected value
                          switch (value) {
                            case 1:
                            // Action for option 1
                              break;
                            case 2:
                            // Action for option 2
                              break;
                            case 3:
                            // Action for option 3
                              break;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),




          ),
        ),
      ),
    );
  }
}


