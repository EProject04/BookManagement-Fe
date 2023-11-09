import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Help Center',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Feedback',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,0,15,15),
                  child: Text('Please, If you have any question let us know by comment below.'),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(10,0,15,0),
                  child: Card(
                    color: Color(0xECECDAC5),
                    child: Padding(
                      padding:  EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration.collapsed(
                          hintText: "Enter your question.",
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.orange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    child: Text('Submit',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),)
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        )
    );
  }
}



