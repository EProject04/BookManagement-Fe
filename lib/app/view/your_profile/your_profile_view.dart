
import 'package:flutter/material.dart';
import 'package:frame/app/view/create_new_account/create_new_account.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class YourProfile extends StatelessWidget {
  const YourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Padding(
                  padding:EdgeInsets.fromLTRB(0,10,20,0),
                  child: Text('Complete Your Profile',
                    style:GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,10,20,0),
                  child:Text('Don\'t worry, only you can se your personal data.'
                      ' No one else will be able to see it.' ,),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // timf hieu ve thu vien chon anh upload anh,
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Image(
                      image: NetworkImage('https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
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
                      Get.to(()=>MainWrapper());
                    },
                    child: const Center(
                      child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



