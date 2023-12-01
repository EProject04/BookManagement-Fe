import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/data/models/authors.dart';
import 'package:frame/app/data/models/category.dart';
import 'package:frame/app/logic/controller/genre_controller.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:get/get.dart';

class GenreDetailCateView extends StatefulWidget {
  const GenreDetailCateView({super.key});

  @override
  State<GenreDetailCateView> createState() => _GenreDetailCateViewState();
}

class _GenreDetailCateViewState extends State<GenreDetailCateView> {
  bool isGridView = true;
  GenreController genreController = Get.put(GenreController());
  Categories categories = Get.arguments;

  void _toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          elevation: 0.0, // remove app bar shadow
          backgroundColor: Colors.white,
          title: Text(
            '${categories.categoryName}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
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
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Show in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: isGridView
                        ? Icon(Icons.view_list_rounded)
                        : Icon(Icons.grid_view_rounded),
                    onPressed: () {
                      _toggleView();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              isGridView ? GridViewGenreDetailByCate() : ListViewGenreDetailByCate(),
              // GenreDetailListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewGenreDetailByCate extends StatefulWidget {
  const ListViewGenreDetailByCate({super.key});

  @override
  State<ListViewGenreDetailByCate> createState() => _ListViewGenreDetailByCateState();
}

class _ListViewGenreDetailByCateState extends State<ListViewGenreDetailByCate> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final genreController = Get.put(GenreController());
    return Expanded(
      child: Obx(
            () => genreController.isLoading.value
            ? Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ))
            : ListView.builder(
            itemCount: genreController.listBookByCate.length,
            itemBuilder: (context, index) {
              final bookByCate = genreController.listBookByCate[index];
              return  InkWell(
                onTap: () {
                  Get.to(() => BookDetailScreenNew(),arguments: bookByCate);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: size.height * 0.3,
                  // color: Colors.amber[600],
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${bookByCate.imagePath}'),
                              fit: BoxFit.fill,
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
                              '${bookByCate.title}',
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
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.03,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEECEC),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Romance',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: size.height * 0.03,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEECEC),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Young Adult',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: size.height * 0.03,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEECEC),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Comedy',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          // SizedBox(height: 20,),
        ),
      ),
    );
  }
}



class GridViewGenreDetailByCate extends StatefulWidget {
  const GridViewGenreDetailByCate({super.key});

  @override
  State<GridViewGenreDetailByCate> createState() => _GridViewGenreDetailByCateState();
}

class _GridViewGenreDetailByCateState extends State<GridViewGenreDetailByCate> {
  @override
  Widget build(BuildContext context) {
    GenreController genreController = Get.put(GenreController());
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width / 2;
    return Expanded(
      child: Obx(
            () => genreController.isLoading.value
            ? Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ))
            : GridView.builder(
            itemCount: genreController.listBookByCate.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (itemWidth / itemHeight)),
            itemBuilder: (BuildContext context, index) {
              final bookByCate = genreController.listBookByCate[index];
              return InkWell(
                onTap: () {
                  Get.to(() => BookDetailScreenNew(), arguments: bookByCate);
                },
                child: Container(
                  // color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // width: size.width * 0.8,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${bookByCate.imagePath}'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${bookByCate.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            size: 20,
                            Icons.star_half,
                            color: Colors.grey,
                          ),
                          Text(
                            '${bookByCate.averageRate}',
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
              );
            }),
      ),
    );
  }
}


