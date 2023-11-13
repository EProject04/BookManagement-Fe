import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutIbBookView extends StatelessWidget {
  const AboutIbBookView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('About ibBook',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  // width: size.width*0.1,
                  padding: EdgeInsets.all(15),
                  height: size.height*0.2,
                  child: Center(
                    child: Image(
                      image: NetworkImage(
                          'https://st3.depositphotos.com/11953928/32310/v/450/depositphotos_323108450-stock-illustration-isolated-books-flat-design.jpg'
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text('ibBook',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,15,0,15),
                  child: Divider(height: 0,),
                ),
                Text('Reading Well is a non-profit project that provides free access to e-books in Vietnamese and English. The project also organizes community activities to encourage reading.Here are some of the project ís goals:Make e-books accessible to everyone, regardless of their financial situation.Improve the quality of e-books.Promote reading culture.The project is still under development, but it has the potential to make a significant impact on the Vietnamese reading community.Here is a more concise version:Reading Well is a non-profit project that provides free e-books in Vietnamese and English. The project also organizes community activities to promote reading.This version is shorter because it removes some of the details that are not essential to the main points of the project. For example, it removes the phrase "by book lovers" from the first sentence, the phrase "with thousands of titles" from the second sentence, and the phrase "no registration or fee required" from the second sentence. It also removes the phrase "Let books pave the way on your journey to greater wisdom and understanding" from the fourth sentence, and the phrases "mainly focuses on Vietnamese books" and "to meet the needs of a wide range of readers" from the sixth sentence.',
                  style: TextStyle(fontSize:20, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
    );
  }
}
