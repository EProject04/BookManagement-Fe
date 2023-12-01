import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/models/book.dart';
import 'package:get/get.dart';

class AboutThisEbookView extends StatelessWidget {
  const AboutThisEbookView({super.key});

  @override
  Widget build(BuildContext context) {
    Books bookDetail = Get.arguments;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'About this Ebook',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(bookDetail.description),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                height: 0,
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 20,
                ),
                children: <Widget>[
                  // ListTile(
                  //   title: Text('Language',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  //   subtitle: Text('English'),
                  // ),
                  // ListTile(
                  //   title: Text('Age',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  //   subtitle: Text('Ages 20 & Up'),
                  // ),
                  ListTile(
                    title: Text(
                      'Author',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: bookDetail.bookFollows
                            .map(
                              (e) => Text(
                                '${e.authorName}, ',
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     'Publisher',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   subtitle: Text(
                  //     'Pottermore Publishing',
                  //     style: TextStyle(
                  //       color: Colors.orange,
                  //     ),
                  //   ),
                  // ),
                  // ListTile(
                  //   title: Text(
                  //     'Published on',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   subtitle: Text('Dec 8, 2015'),
                  // ),
                  ListTile(
                    title: Text(
                      'Genre',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: bookDetail.categoriesBook
                            .map(
                              (e) => Text(
                            '${e.categoryName}, ',

                          ),
                        )
                            .toList(),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     'Pages',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   subtitle: Text('784'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
