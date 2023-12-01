import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/services/request_api.dart';
import 'package:frame/app/logic/controller/genre_controller.dart';
import 'package:frame/app/logic/controller/home_controller.dart';
import 'package:frame/app/view/genre_detail/genre_detail_by_author_view.dart';
import 'package:frame/app/view/genre_detail/genre_detail_view.dart';
import 'package:get/get.dart';

class ExploreByGenreView extends StatelessWidget {
  const ExploreByGenreView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0, // remove app bar shadow
          backgroundColor: Colors.white,
          title: Text(
            'Explore By Author',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: GenreGridView(),
        ),
      ),
    );
  }
}

class GenreGridView extends StatefulWidget {
  const GenreGridView({super.key});

  @override
  State<GenreGridView> createState() => _GenreGridViewState();
}

class _GenreGridViewState extends State<GenreGridView> {
  var genreController = Get.put(GenreController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => genreController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ))
          : GridView.builder(
              itemCount: genreController.authors.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                final author = genreController.authors[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      genreController.getBookByAuthorName(author.authorName);
                      Get.to(() => GenreDetailAuthorView(), arguments: author);
                      // bookGenre.forEach((element) {
                      //
                      // });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        author.authorName.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontFeatures: [
                            FontFeature.proportionalFigures(),
                          ],
                          fontSize: 18,
                          // shadows: <Shadow>[
                          //   Shadow(
                          //     blurRadius: 3.0,
                          //     color: Color.fromARGB(255, 0, 0, 0),
                          //   ),
                          // ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(RequestApi.IMG_LOGO_APP),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.pinkAccent,
                        width: 0.5,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
