
import 'package:flutter/material.dart';
import 'package:frame/app/view/create_new_account/create_new_account.dart';
import 'package:frame/app/view/home/home_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Country{
  final int id;
  final String country_name;

  Country(this.id, this.country_name);
}
List<String> list = <String>['Vietnamese', 'United States', 'Korea', 'Japan'];
class YourProfile extends StatefulWidget{
  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile>{

  List<Country> country = <Country>[];
  String dropdownValue = list.first;
  @override
  void initState(){
    super.initState();
    country.add(new Country(1, 'Vietnamese'));
    country.add(new Country(2, 'United States'));
    country.add(new Country(3, 'Korea'));
    country.add(new Country(4, 'Japan'));
  }


  @override
  Widget build(BuildContext context){
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
                      image: NetworkImage("data:image/jpeg;base64,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"),
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
                      Get.to(HomePage());
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

