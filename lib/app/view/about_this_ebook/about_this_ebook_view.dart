import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutThisEbookView extends StatefulWidget {
  const AboutThisEbookView({super.key});

  @override
  State<AboutThisEbookView> createState() => _AboutThisEbookViewState();
}

class _AboutThisEbookViewState extends State<AboutThisEbookView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child:
      Scaffold(
        appBar: AppBar(
          title: Text('About this Ebook',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all(15.0),
                child: Text('ddddddddddddddddddddd\nddddddddddddddddddddddddd'),
              ),
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.fromLTRB(15,0,15,0),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    mainAxisSpacing: 20,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('Language',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('English'),
                    ),
                    ListTile(
                      title: Text('Age',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('Ages 20 & Up'),
                    ),
                    ListTile(
                      title: Text('Author',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('J.K Rowling',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Publisher',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('Pottermore Publishing',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Published on',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('Dec 8, 2015'),
                    ),
                    ListTile(
                      title: Text('Genre',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('Fantasy, Fiction, Magic'),
                    ),
                    ListTile(
                      title: Text('Pages',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('784'),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
