import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutIbBookView extends StatefulWidget {
  const AboutIbBookView({super.key});

  @override
  State<AboutIbBookView> createState() => _AboutIbBookViewState();
}

class _AboutIbBookViewState extends State<AboutIbBookView> {
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
                Text('A graduation products of Aptech student group.'),
              ],
            ),
          ),
        )
    );
  }
}
