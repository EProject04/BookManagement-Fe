
import 'package:flutter/material.dart';
import 'package:frame/app/view/your_profile/your_profile_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Country{
  final int id;
  final String country_name;

  Country(this.id, this.country_name);
}
List<String> list = <String>['Vietnamese', 'United States', 'Korea', 'Japan'];
class CreateAccount extends StatefulWidget{
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>{

  List<Country> country = <Country>[];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body:
        Container(
          padding:EdgeInsets.fromLTRB(20,0,20,0),
          child: ListView(

            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:EdgeInsets.fromLTRB(0,10,20,0),
                child: Text('Create an Account',
                  style:GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,10,20,20),
                child:Text('Enter your username, email & password. If you forget it,'
                    ' then you have to do forgot password.' ,),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Username',
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
                    Text('Email',
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
                    Text('Password',
                      style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.visibility_off),
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
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Confirm Password',
                      style: TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.visibility_off),
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
              Container(

                margin: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange)
                  ),
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(builder: (context)=> ChooseAge()));
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> YourProfile()));
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
    );
  }
}

