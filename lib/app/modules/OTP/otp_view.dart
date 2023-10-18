import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPController extends GetxController{
  List<String> otp = List<String>.filled(5, "");
  RxBool wrongOTP = false.obs;
  void otpConfirm(){
    if(otp[0]+otp[1]+otp[2]+otp[3]+otp[4] == "12345"){
      Get.toNamed('createNewPassword');
    }else{
      wrongOTP.value = true;
    }
  }
}

class OTPPage extends StatelessWidget {
  static final _pageInstance = OTPPage._internal();
  factory OTPPage() => _pageInstance;
  OTPPage._internal();

  final pageController = Get.put(OTPController());

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
                child: IconButton(onPressed: () => Get.toNamed('/login'), icon: Icon(Icons.arrow_back)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.bottomLeft,
                child: Text('You\'ve Got Mail', style: GoogleFonts.urbanist(
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
                child: Text('We have sent the OTP verification code to your email address. Check your email and enter the code below.', style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )
                )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 21),
                  width: 350,
                  child: OtpForm()
              ),
              Obx(
                      () => Container(
                    child: pageController.wrongOTP.value ? Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        "Wrong OTP",
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.red
                          )
                        ),
                      ),
                    ) : null,
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: const Text(
                    'Din\'t receive email?'
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You can resend code in'),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: const OTPResendCountDown(),
                  )
                ],
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
                        onPressed: () => pageController.otpConfirm(),
                        child: const Text(
                          'Confirm',
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

//OTP field
class OtpForm extends StatelessWidget {
  OtpForm({super.key});

  final OTPController pageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              cursorColor: const Color.fromRGBO(248, 147, 0, 1),
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 0.3),
                focusColor: Color.fromRGBO(248, 147, 0, 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(248, 147, 0, 1)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1)
                    )
                ),
              ),
              onChanged: (value){
                if(value.length == 1){
                  pageController.otp[0] = value;
                  FocusScope.of(context).nextFocus();
                }
                if(value.isEmpty){
                  pageController.otp[0] = "";
                  pageController.wrongOTP.value = false;
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              cursorColor: const Color.fromRGBO(248, 147, 0, 1),
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 0.3),
                focusColor: Color.fromRGBO(248, 147, 0, 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(248, 147, 0, 1)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1)
                    )
                ),
              ),
              onChanged: (value){
                if(value.length == 1){
                  pageController.otp[1] = value;
                  FocusScope.of(context).nextFocus();
                }
                if(value.isEmpty){
                  pageController.otp[1] = "";
                  pageController.wrongOTP.value = false;
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              cursorColor: const Color.fromRGBO(248, 147, 0, 1),
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 0.3),
                focusColor: Color.fromRGBO(248, 147, 0, 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(248, 147, 0, 1)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1)
                    )
                ),
              ),
              onChanged: (value){
                if(value.length == 1){
                  pageController.otp[2] = value;
                  FocusScope.of(context).nextFocus();
                }
                if(value.isEmpty){
                  pageController.otp[2] = "";
                  pageController.wrongOTP.value = false;
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              cursorColor: const Color.fromRGBO(248, 147, 0, 1),
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 0.3),
                focusColor: Color.fromRGBO(248, 147, 0, 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(248, 147, 0, 1)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1)
                    )
                ),
              ),
              onChanged: (value){
                if(value.length == 1){
                  pageController.otp[3] = value;
                  FocusScope.of(context).nextFocus();
                }
                if(value.isEmpty){
                  pageController.otp[3] = "";
                  pageController.wrongOTP.value = false;
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              cursorColor: const Color.fromRGBO(248, 147, 0, 1),
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 0.3),
                focusColor: Color.fromRGBO(248, 147, 0, 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(248, 147, 0, 1)
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1)
                    )
                ),
              ),
              onChanged: (value){
                if(value.length == 1){
                  pageController.otp[4] = value;
                }
                if(value.isEmpty){
                  pageController.otp[4] = "";
                  pageController.wrongOTP.value = false;
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//OTP resend countdown
class OTPResendCountDown extends StatelessWidget {
  const OTPResendCountDown({super.key});

  Stream<String> fetchTime() async* {
    int i = 60;
    DateTime date;
    while(i>-1){
      await Future.delayed(const Duration(seconds: 1));
      yield i.toString();
      i--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: fetchTime(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text(60.toString(),style: TextStyle(
              color: Color.fromRGBO(248, 147, 0, 1),
              fontSize: 15,
              fontWeight: FontWeight.w800,
              fontFamily: 'Urbanist'
          ));
        }
        if((snapshot.connectionState == ConnectionState.active)){
          if(snapshot.hasError){
            return const Text('error',style: TextStyle(
                color: Color.fromRGBO(248, 147, 0, 1),
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'Urbanist'
            ));
          }
          if(snapshot.hasData){
            return Text(snapshot.data.toString(),style: TextStyle(
                color: Color.fromRGBO(248, 147, 0, 1),
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'Urbanist'
            ));
          }else{
            return const Text('no data found',style: TextStyle(
                color: Color.fromRGBO(248, 147, 0, 1),
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'Urbanist'
            ));
          }
        }else{
          return GestureDetector(
            onTap: (){
            },
            child: const Text("here",style: TextStyle(
                color: Color.fromRGBO(248, 147, 0, 1),
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'Urbanist'
            )),
          );
        }
      },
    );
  }
}