import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordController extends GetxController{
  RxBool passwordIsHidden = true.obs;
  RxBool confirmPasswordIsHidden = true.obs;

  void showHidePassword(){
    passwordIsHidden.value = !passwordIsHidden.value;
  }

  void showHideConfirmPassword(){
    passwordIsHidden.value = !passwordIsHidden.value;
  }
}

class CreateNewPasswordPage extends StatelessWidget {
  static final _pageInstance = CreateNewPasswordPage._internal();
  factory CreateNewPasswordPage() => _pageInstance;
  CreateNewPasswordPage._internal();

  final pageController = CreateNewPasswordController();
  final formKey = GlobalKey<FormState>();

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
                child: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text('Create New Password', style: GoogleFonts.urbanist(
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
                child: Text('Enter your new password', style: GoogleFonts.urbanist(
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
                            child: Text('Password', style: GoogleFonts.urbanist(
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
                            child: Obx( ()=> TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(onTap: pageController.showHidePassword,
                                    child: pageController.passwordIsHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
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
                              obscureText: pageController.passwordIsHidden.value,
                              validator: (password){
                                if(password!.isEmpty){
                                  return "Please enter your new password";
                                }
                                if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
                                  return "Length greater than 8 and no special key";
                                }
                              },
                            ))
                        ),
                        Positioned(
                            top: 90,
                            right: 0,
                            left: 0,
                            child: Text('Confirm Password', style: GoogleFonts.urbanist(
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
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(onTap: pageController.showHideConfirmPassword,
                                    child: pageController.confirmPasswordIsHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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
                                obscureText: pageController.confirmPasswordIsHidden.value,
                                validator: (password){
                                  if(password!.isEmpty){
                                    return "Please re-enter your password";
                                  }
                                  if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
                                    return "Length greater than 8 and no special key";
                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                  )
              ),

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
                          // if(formKey.currentState!.validate()){
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  title: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "New Password",
                                          style: TextStyle(
                                              color: Color.fromRGBO(248, 147, 0, 1),
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      )),
                                  content: Builder(
                                      builder: (context){
                                        return Container(
                                          height: 424,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Reset Pasword",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(248, 147, 0, 1),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                Text(
                                                  "Successful!",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(248, 147, 0, 1),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                                    child: Text("Your password has been successfully changed.",
                                                      textAlign: TextAlign.center,
                                                    )
                                                ),
                                                Container(
                                                  width: 1000,
                                                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        backgroundColor: Color.fromRGBO(248, 147, 0, 1),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(25)
                                                        )
                                                    ),
                                                    child: Text(
                                                      "Go to Home",
                                                      style: TextStyle(
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    onPressed: null,
                                                  ),
                                                )
                                              ],),
                                          )
                                          ,);
                                      })
                              ));
                          // }
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Urbanist',
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        )),
                  ))
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