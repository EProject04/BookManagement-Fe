
import 'package:flutter/material.dart';
import 'package:frame/app/logic/controller/register_controller.dart';
import 'package:frame/app/view/your_profile/your_profile_view.dart';
import 'package:frame/main_wrapper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends GetView<RegisterController> {

  final registerController = RegisterController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body:
        Container(
          padding:EdgeInsets.fromLTRB(20,0,20,0),
          child: Form(
            key: formKey,
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
                      TextFormField(
                        controller: registerController.usernameController,
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
                        validator: (value) => registerController.usernameValidate(value),
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
                      TextFormField(
                        controller: registerController.emailController,
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
                        validator: (value) => registerController.emailValidate(value),
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
                      TextFormField(
                        controller: registerController.passwordController,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                        decoration: InputDecoration(
                            // suffixIcon: IconButton(
                            //   onPressed: (){
                            //     registerController.isHidden.value = !registerController.isHidden.value;
                            //
                            //   },
                            //   icon: registerController.isHidden.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                            // ),

                            // labelText: 'Full Name',
                            // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            )
                        ),
                        obscureText: registerController.isHidden.value,
                        validator: (value) => registerController.passwordValidate(value),
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
                      TextFormField(
                        controller: registerController.confirmPasswordController,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            // suffixIcon: IconButton(
                            //   onPressed: (){},
                            //   icon: Icon(Icons.visibility_off),
                            // ),
                            // labelText: 'Full Name',
                            // labelStyle: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            )
                        ),
                        obscureText: registerController.isHidden.value,
                        validator: (value) => registerController.confirmValidate(value),
                      ),
                    ],
                  ),
                ),
                Container(

                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange)
                    ),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        registerController.register();
                        Get.to(()=>MainWrapper());
                      }


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



