
import 'package:flutter/material.dart';


class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Personal Info',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){
              },
              icon: Icon(
                Icons.edit_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding:EdgeInsets.fromLTRB(20,0,20,0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Container(
                    // timf hieu ve thu vien chon anh upload anh,
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Image(
                        image:NetworkImage('https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Full Name',
                          style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            // labelText: 'Full Name',
                            // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Age',
                          style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            // labelText: 'Full Name',
                            // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Phone Number',
                          style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            // labelText: 'Full Name',
                            // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date of Birth',
                          style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.calendar_month),
                              ),
                              // labelText: 'Full Name',
                              // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 400,
                  //   padding: EdgeInsets.fromLTRB(
                  //       0, 0, 0, 20),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text('Country',
                  //         style: TextStyle(
                  //             fontSize:15,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //       DropdownButton<String>(
                  //         value: dropdownValue,
                  //         icon: const Icon(Icons.arrow_downward),
                  //         elevation: 8,
                  //         isExpanded: true,
                  //         style: const TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                  //         underline: Container(
                  //           height: 1,
                  //           color: Colors.orange,
                  //         ),
                  //         onChanged: (String? value){
                  //           setState(() {
                  //             dropdownValue = value!;
                  //           });
                  //         },
                  //         items: list.map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange)
                      ),
                      onPressed: () {

                      },
                      child: const Center(
                        child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


