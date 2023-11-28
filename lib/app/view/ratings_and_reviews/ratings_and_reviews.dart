
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/logic/controller/ratings_and_reviews_controller.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


class RatingsAndReviewsView extends GetView<RatingsAndReviewsController> {
  // const RatingsAndReviewsView({super.key});
  Books bookDetail = Get.arguments;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Ratings & Reviews',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            // actions: <Widget>[
            //   IconButton(
            //     onPressed: (){
            //
            //     },
            //     icon: Icon(
            //       Icons.pending_outlined,
            //       size: 30,
            //     ),
            //   ),
            // ],
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight( // wrap it to show vertical divider
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width*0.4,
                        height: size.height*0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('4.9',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 10,),
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: 5,
                              minRating: 1,
                              allowHalfRating: true,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color: Colors.orange,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(height: 10,),
                            Text('(6.8k reviews)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),

                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      Container(
                        // color: Colors.cyanAccent,
                        width: size.width*0.4,
                        height: size.height*0.15,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context,index) => Container
                            (
                              padding: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                // SizedBox(
                //   height: 5,
                // ),
                // Divider(
                //   thickness: 1,
                //   color: Colors.grey[300],
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: ChoiceRate(),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context,index){
                      return   Column(
                        children:
                        bookDetail.comments.map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),//set default padding to 0
                              // leading: CircleAvatar(
                              //   backgroundImage: NetworkImage(
                              //       'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='
                              //   ),
                              // ),
                              title: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(e.fullName??'',
                                  maxLines: 1,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              trailing: Container(
                                width: size.width*0.22,
                                height: size.height*0.04,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width*0.15,
                                      height: size.height*0.03,
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Icon(
                                              Icons.star_rounded,
                                              size: 16,
                                              color: Colors.orange,
                                            ),
                                            Text(' ${e.rate}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange
                                              ),
                                            ),
                                          ]

                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.orange
                                          ),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      onPressed: (){},
                                      icon: Icon(Icons.pending_outlined),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(e.commentText),
                            SizedBox(height: 10,),
                            Text('6 months ago',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                            SizedBox(height: 20,),
                          ],
                        )).toList(),

                      );
                    }

                  ),
                ),

              ],
            ),
          ),
        )

    );
  }
}

class ListRate{
  final String rate;
  bool isSelected;

  ListRate(this.rate, this.isSelected);
}

class ChoiceRate extends StatefulWidget {
  const ChoiceRate({super.key});

  @override
  State<ChoiceRate> createState() => _ChoiceRateState();
}

class _ChoiceRateState extends State<ChoiceRate> {
  bool isSelected = false;
  List<ListRate> listRate = <ListRate>[];

  @override
  void initState() {
    super.initState();
    listRate.add(ListRate('All', false));
    listRate.add(ListRate('5', false));
    listRate.add(ListRate('4', false));
    listRate.add(ListRate('3', false));
    listRate.add(ListRate('2', false));
    listRate.add(ListRate('1', false));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:listRate.map((item)=>Container(
        padding: EdgeInsets.only(right: 5),
        child: ChoiceChip(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          ),
          label: Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: item.isSelected?Colors.white :Colors.orange,
                size: 20,
              ),
              Text(item.rate,
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color: item.isSelected?Colors.white :Colors.orange
                ),
              ),
            ],
          ),
          selected: item.isSelected,
          onSelected: (isSelected){
            setState(() {
              listRate.forEach((element) =>element.isSelected = false);
              item.isSelected = true;
            });
          },
          selectedColor: Colors.orange,
        ),
      ),
      ).toList(),

    );
  }
}
