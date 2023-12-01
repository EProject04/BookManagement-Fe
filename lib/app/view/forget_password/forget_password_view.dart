import 'package:flutter/material.dart';
import 'package:frame/app/view/login/login_view.dart';
import 'package:frame/app/view/otp/otp_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordController extends GetxController{
  String? emailValidate(String? email){
    if (email!.isEmpty) {
      return "Please enter your email";
    }
    if (!RegExp(r'[a-z 0-9]+@(?:gmail\.)+[a-z 0-9]')
        .hasMatch(email)) {
      return "Incorrect email";
    }
  }
  void sendOTP(){
    Get.to(OTPPage());
  }
}

class ForgetPasswordPage extends StatelessWidget {
  static final _pageInstance = ForgetPasswordPage._internal();
  factory ForgetPasswordPage() => _pageInstance;
  ForgetPasswordPage._internal();

  final pageController = ForgetPasswordController();


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: () => Get.to(()=>LoginPage()), icon: Icon(Icons.arrow_back)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Forgot Password', style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Enter your email address. We will send an OTP code for verification',
                    style: GoogleFonts.urbanist(
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
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  alignment: Alignment.bottomLeft,
                  child: Form(
                    key: formKey,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                                'Email', style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
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
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  )
                              ),
                              validator: (value) => pageController.emailValidate(value),
                            )
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(child: Container()),
              Container(
                width: 10000,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color.fromRGBO(248, 147, 0, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        pageController.sendOTP();
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                      ),
                    )),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}