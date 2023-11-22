import 'package:flutter/material.dart';
import 'package:frame/app/logic/controller/login_controller.dart';
import 'package:frame/app/view/forget_password/forget_password_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends GetView<LoginController> {

  static final _pageInstance = LoginPage._internal();
  factory LoginPage() => _pageInstance;
  LoginPage._internal();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final pageController = LoginController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child:  IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text('Hello there', style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
              Container(
                margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text('Please enter your username/email and password to sign in', style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )
                )),
              ),
              Container(
                // color: Colors.blue,
                  height: 180,
                  margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  alignment: Alignment.bottomLeft,
                  child: Form(
                    key: formKey,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Text('User Name', style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                )
                            ))
                        ),
                        Positioned(
                            top: 10,
                            right: 0,
                            left: 0,
                            child: TextFormField(
                              controller: username,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(248, 147, 0, 1)
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(248, 147, 0, 1)
                                    )
                                ),
                              ),
                              style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  )
                              ),
                              validator: (value) => pageController.usernameValidate(value),
                            )
                        ),
                        Positioned(
                            top: 90,
                            right: 0,
                            left: 0,
                            child: Text('Password', style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                )
                            ))),
                        Positioned(
                          top: 100,
                          right: 0,
                          left: 0,
                          child: Obx(
                                  () => TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(onTap: (){
                                    pageController.isHidden.value = !pageController.isHidden.value;
                                  },
                                      child: pageController.isHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(248, 147, 0, 1)
                                      )
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(248, 147, 0, 1)
                                      )
                                  ),
                                ),
                                style: GoogleFonts.urbanist(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    )
                                ),
                                obscureText: pageController.isHidden.value,
                                validator: (value) => pageController.passwordValidate(value),
                              )),
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(238, 238, 238, 1)
                        )
                    )
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(ForgetPasswordPage()),
                child: const Text('Forgot Password', style: TextStyle(
                    color: Color.fromRGBO(248, 147, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Urbanist'
                ),
                ),),
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                )
                            ),
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                pageController.login(username.text,password.text);
                                username.clear();
                                password.clear();
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Urbanist',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            )),
                      )
                  )
                ],
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}