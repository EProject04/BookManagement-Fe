import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/view/about_ibbook/about_ibbook_view.dart';

import 'package:frame/app/view/help_center/help_center_view.dart';
import 'package:frame/app/view/personal_info/personal_info_view.dart';
import 'package:get/get.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                      Icons.pending_outlined,
                    size: 30,
                  ),
              ),
            ],
          ),
          body: Container(

            child: ListView(
              children: <Widget>[
                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='
                      ),
                    ),
                    title:Text('Tran Thanh Nhat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text('nhat.tt.dev@gmail.com',style: TextStyle(color: Colors.grey),),
                    trailing: Icon(Icons.edit_rounded),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,0,15,10),
                  child: Divider(height: 0,),
                ),

                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('Personal Info',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){
                        Get.to(PersonalInfoView());
                      },
                    ),
                  ),
                ),
                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.settings,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('Preferences',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){

                      },
                    ),
                  ),
                ),

                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.grid_view_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('Languages',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text('English (US)', style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.remove_red_eye,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('Dark Mode',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){

                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Divider(height: 0,),
                ),

                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.edit_document,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('Help Center',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){
                        Get.to(HelpCenterView());
                      },
                    ),
                  ),
                ),

                Container(
                  // color: Colors.orange,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFD8EEF8),
                      child: Icon(Icons.notification_important,
                        color: Colors.blue,
                      ),
                    ),
                    title:Text('About ibBook',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: IconButton(
                      padding: EdgeInsets.zero,//bo padding
                      constraints: BoxConstraints(),//bo gioi han de can sat le
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: (){
                        Get.to(AboutIbBookView());
                      },
                    ),
                  ),
                ),
                Container(
                  // color: Colors.orange,
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context){
                          return SizedBox(

                            height: size.height*0.3,
                            child: Center(
                              child: Column(


                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Text('Logout',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15,0,15,0),
                                    child: Divider(height: 0,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Text('Are you sure you want to log out?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Container(
                                        width: size.width * 0.3,
                                        child: ElevatedButton(
                                          child: Text('Cancel',
                                            style: TextStyle(
                                                color: Colors.orange
                                            ),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25),)
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: size.width*0.05,),
                                      Container(
                                        width: size.width * 0.3,
                                        child: ElevatedButton(
                                          child: Text('Yes, Logout',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                          onPressed: () => Navigator.pop(context),
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

                                ],
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        )
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFD8EEF8),
                        child: Icon(Icons.logout_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      title:Text('Log out',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
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