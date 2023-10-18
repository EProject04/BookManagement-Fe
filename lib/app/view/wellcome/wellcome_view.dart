import 'dart:ui';

import 'package:flutter/material.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage("https://transcode-v2.app.engoo.com/image/fetch/f_auto,c_lfill,w_300,dpr_3/https://assets.app.engoo.com/images/3FvQirWDDKIgBIPk5cDxnC.jpeg"),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.5,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Welcome to",
                                style: TextStyle(
                                    fontFeatures: [
                                      FontFeature.proportionalFigures(),
                                    ],
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: Text(
                                  "ibBook",
                                  style: TextStyle(
                                      fontFeatures: [
                                        FontFeature.proportionalFigures(),
                                      ],
                                      color: Colors.orangeAccent,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  child: Icon(Icons.waving_hand_outlined, color: Colors.amberAccent,)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Text(
                        "ibBook - The ultimate knowledge library, always growing",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFeatures: [
                              FontFeature.proportionalFigures(),
                            ],
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text("Get Started",

                          style: TextStyle(
                              fontFeatures: [
                                FontFeature.proportionalFigures(),
                              ],
                              fontSize: 15,
                              color:Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFEF4E6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                            "I Already Have an Account",

                          style: TextStyle(
                              fontFeatures: [
                                FontFeature.proportionalFigures(),
                              ],
                            fontSize: 15,
                            color:Colors.orangeAccent
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
      ),
    );
  }
}
