import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/view/genre_detail/genre_detail_view.dart';
import 'package:get/get.dart';

class BookGenre{
  final int id;
  final String genre;
  bool isSelected;
  BookGenre(this.id, this.genre, this.isSelected);
}

class ExploreByGenreView extends StatelessWidget {
  const ExploreByGenreView({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,// remove app bar shadow
          backgroundColor: Colors.white,
          title: Text('Explore By Genre',
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
              onPressed: (){},
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
  List<BookGenre> bookGenre = <BookGenre>[];

  @override
  Widget build(BuildContext context) {
    bookGenre.add(new BookGenre(1, 'Romance', false));
    bookGenre.add(new BookGenre(2, 'Fantasy', false));
    bookGenre.add(new BookGenre(3, 'Sci-Fi', false));
    bookGenre.add(new BookGenre(4, 'Horror', false));
    bookGenre.add(new BookGenre(5, 'Mystery', false));
    bookGenre.add(new BookGenre(6, 'Thriller', false));
    bookGenre.add(new BookGenre(7, 'Psychology', false));
    bookGenre.add(new BookGenre(8, 'Inspiration', false));
    bookGenre.add(new BookGenre(9, 'Comedy', false));
    bookGenre.add(new BookGenre(10, 'Action', false));
    bookGenre.add(new BookGenre(11, 'Adventure', false));
    bookGenre.add(new BookGenre(12, 'Comics', false));
    bookGenre.add(new BookGenre(13, 'Children\'s', false));
    bookGenre.add(new BookGenre(14, 'Art & Photography', false));
    bookGenre.add(new BookGenre(15, 'Food & Drink', false));
    bookGenre.add(new BookGenre(16, 'Biography', false));
    bookGenre.add(new BookGenre(17, 'Science & Technology', false));
    bookGenre.add(new BookGenre(18, 'Guide / How-to', false));
    bookGenre.add(new BookGenre(19, 'Travel', false));
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      children: bookGenre.map(
            (item)=>InkWell(
          onTap:(){
            setState(() {
              Get.to(()=>GenreDetailView());
              // bookGenre.forEach((element) {
              //
              // });
            });
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(item.genre,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1618588507085-c79565432917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fHww&w=1000&q=80'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ).toList(),
    );
  }
}



