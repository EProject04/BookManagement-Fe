

import 'package:flutter/material.dart';
import 'package:frame/app/logic/controller/profile_controller.dart';
import 'package:frame/app/view/create_new_account/create_new_account.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  TextEditingController dobController = TextEditingController();
  // DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1890),
        lastDate: DateTime.now());
    if (picked != null && picked.toString() != dobController.text) {
      setState(() {
        // selectedDate = picked;
        dobController.text = DateFormat('dd-MM-yyyy').format(picked);


      });
    }
  }


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
                      TextFormField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: dobController.text
                        ),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => _selectDate(context)
                              ,
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


// class YourProfile extends GetView<ProfileController> {
//   const YourProfile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       body:
//       SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding:EdgeInsets.fromLTRB(20,0,20,0),
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: ListView(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding:EdgeInsets.fromLTRB(0,10,20,0),
//                   child: Text('Complete Your Profile',
//                     style:GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0,10,20,0),
//                   child:Text('Don\'t worry, only you can se your personal data.'
//                       ' No one else will be able to see it.' ,),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   // timf hieu ve thu vien chon anh upload anh,
//                   width: 150,
//                   height: 150,
//                   child: Center(
//                     child: Image(
//                       image: NetworkImage('https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(
//                       0, 0, 0, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Full Name',
//                         style: TextStyle(
//                             fontSize:15,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       TextField(
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         decoration: InputDecoration(
//                           // labelText: 'Full Name',
//                           // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
//
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(
//                       0, 0, 0, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Age',
//                         style: TextStyle(
//                             fontSize:15,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       TextField(
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         decoration: InputDecoration(
//                           // labelText: 'Full Name',
//                           // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
//
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(
//                       0, 0, 0, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Phone Number',
//                         style: TextStyle(
//                             fontSize:15,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       TextField(
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         decoration: InputDecoration(
//                           // labelText: 'Full Name',
//                           // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
//
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(
//                       0, 0, 0, 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Date of Birth',
//                         style: TextStyle(
//                             fontSize:15,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       TextFormField(
//                         initialValue: selectedDate.toString(),
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         decoration: InputDecoration(
//                             suffixIcon: IconButton(
//                               onPressed: (){
//                                 _selectDate(context);
//                               },
//                               icon: Icon(Icons.calendar_month),
//                             ),
//                             // labelText: 'Full Name',
//                             // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.orange),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Container(
//                 //   width: 400,
//                 //   padding: EdgeInsets.fromLTRB(
//                 //       0, 0, 0, 20),
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: <Widget>[
//                 //       Text('Country',
//                 //         style: TextStyle(
//                 //             fontSize:15,
//                 //             fontWeight: FontWeight.bold
//                 //         ),
//                 //       ),
//                 //       DropdownButton<String>(
//                 //         value: dropdownValue,
//                 //         icon: const Icon(Icons.arrow_downward),
//                 //         elevation: 8,
//                 //         isExpanded: true,
//                 //         style: const TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
//                 //         underline: Container(
//                 //           height: 1,
//                 //           color: Colors.orange,
//                 //         ),
//                 //         onChanged: (String? value){
//                 //           setState(() {
//                 //             dropdownValue = value!;
//                 //           });
//                 //         },
//                 //         items: list.map<DropdownMenuItem<String>>((String value) {
//                 //           return DropdownMenuItem<String>(
//                 //             value: value,
//                 //             child: Text(value),
//                 //           );
//                 //         }).toList(),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.orange)
//                     ),
//                     onPressed: () {
//                       Get.to(()=>MainWrapper());
//                     },
//                     child: const Center(
//                       child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 18),),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//


