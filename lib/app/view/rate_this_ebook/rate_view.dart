import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:frame/app/data/models/comment.dart';
import 'package:frame/app/logic/controller/rate_this_ebook_controller.dart';

import 'package:get/get.dart';

class RateView extends GetView<RateThisEbookController> {
  // const RateView({super.key});
  final rateController = Get.put(RateThisEbookController());
  Books bookDetail = Get.arguments;
  // Comment comment =
  int commentRate = 5;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Review Book',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: size.height * 0.17,
                  // color: Colors.amber[600],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(bookDetail.imagePath),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              bookDetail.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  size: 20,
                                  Icons.star_half,
                                  color: Colors.grey,
                                ),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: bookDetail.categoriesBook
                                    .map(
                                      (e) => Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: size.height * 0.03,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEECEC),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                e.categoryName,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Rate this Ebook',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (rating) {
                       commentRate = rating.toInt();
                      // print(commentRate);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 0,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Describe Your Experience (Optional)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: rateController.commentText,
                  maxLines: 8,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 0,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfff5e4cb),
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: size.width * 0.45,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            print(commentRate);
                            rateController.createReview(bookDetail.id, commentRate);
                          },
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ], // SizedBox(height: 20,),
            ),
          ),
        ),
      ),
    );
  }
}
