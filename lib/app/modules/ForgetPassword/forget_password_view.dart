import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordPage extends StatelessWidget {
  static final _pageInstance = ForgetPasswordPage._internal();
  factory ForgetPasswordPage() => _pageInstance;
  ForgetPasswordPage._internal();

  final formKey = GlobalKey<FormState>();
  RxBool isHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: const IconButton(
                    onPressed: null, icon: Icon(Icons.arrow_back)),
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
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                              validator: (account) {
                                if (account!.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!RegExp(r'[a-z 0-9]+@(?:gmail\.)+[a-z 0-9]')
                                    .hasMatch(account)) {
                                  return "Incorrect email";
                                }
                              },
                            )
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(child: Container()),
              Container(
                width: 10000,
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {

                      }
                    },
                    child: const Text(
                      'Sign In',
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