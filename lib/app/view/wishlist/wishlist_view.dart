import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
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
            child: ListView(
              children: <Widget>[
                Container(
                  height: size.height * 0.15,
                  // color: Colors.amber[600],
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
                            PopupMenuItem(
                              value: 2,
                              child:  Row(
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(width: 10,),
                                  Text('Share')
                                ],
                              )
                            ),
                            PopupMenuItem(
                              value: 3,
                              child:  Row(
                                children: [
                                  Icon(Icons.info_outline_rounded),
                                  SizedBox(width: 10,),
                                  Text('About ibBook')
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
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
    );
  }
}

