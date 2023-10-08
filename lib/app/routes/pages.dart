// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// //Login Screen
// class LoginPage extends StatelessWidget {
//   static final _pageInstance = LoginPage._internal();
//   factory LoginPage() => _pageInstance;
//   LoginPage._internal();
//
//   final formKey = GlobalKey<FormState>();
//   RxBool isHidden = true.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('Hello there', style: GoogleFonts.urbanist(
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 )),
//               ),
//               Container(
//                 margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('Please enter your username/email and password to sign in', style: GoogleFonts.urbanist(
//                     textStyle: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     )
//                 )),
//               ),
//               Container(
//                 // color: Colors.blue,
//                   height: 180,
//                   margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                   alignment: Alignment.bottomLeft,
//                   child: Form(
//                     key: formKey,
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Positioned(
//                             left: 0,
//                             top: 0,
//                             child: Text('Email / Phone Number', style: GoogleFonts.urbanist(
//                                 textStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w800,
//                                 )
//                             ))
//                         ),
//                         Positioned(
//                             top: 10,
//                             right: 0,
//                             left: 0,
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                               ),
//                               style: GoogleFonts.urbanist(
//                                   textStyle: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w800,
//                                   )
//                               ),
//                               validator: (account){
//                                 if(account!.isEmpty){
//                                   return "Please enter your phone number or email";
//                                 }
//                                 if(!RegExp(r'[a-z 0-9]+@(?:gmail\.)+[a-z 0-9]').hasMatch(account) && !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(account)){
//                                   return "Incorrect phone number or email";
//                                 }
//                               },
//                             )
//                         ),
//                         Positioned(
//                             top: 90,
//                             right: 0,
//                             left: 0,
//                             child: Text('Password', style: GoogleFonts.urbanist(
//                                 textStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w800,
//                                 )
//                             ))),
//                         Positioned(
//                           top: 100,
//                           right: 0,
//                           left: 0,
//                           child: Obx(
//                                   () => TextFormField(
//                                 decoration: InputDecoration(
//                                   suffixIcon: GestureDetector(onTap: (){
//                                     isHidden.value = !isHidden.value;
//                                   },
//                                     child: Obx(
//                                             () => isHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
//                                     ),
//                                   ),
//                                   focusedBorder: const UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(248, 147, 0, 1)
//                                       )
//                                   ),
//                                   enabledBorder: const UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(248, 147, 0, 1)
//                                       )
//                                   ),
//                                 ),
//                                 style: GoogleFonts.urbanist(
//                                     textStyle: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w800,
//                                     )
//                                 ),
//                                 obscureText: isHidden.value,
//                                 validator: (password){
//                                   if(password!.isEmpty){
//                                     return "Please enter your password";
//                                   }
//                                   if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
//                                     return "Length greater than 8 and no special key";
//                                   }
//                                 },
//                               )),
//                         ),
//                       ],
//                     ),
//                   )
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
//                 decoration: const BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(
//                             color: Color.fromRGBO(238, 238, 238, 1)
//                         )
//                     )
//                 ),
//               ),
//               const Text('Forgot Password', style: TextStyle(
//                   color: Color.fromRGBO(248, 147, 0, 1),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   fontFamily: 'Urbanist'
//               ),),
//               Container(
//                 height: 13,
//               ),
//               Expanded(child: Container()),
//               Container(
//                 width: 10000,
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.all(15),
//                       backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
//                     ),
//                     onPressed: (){
//                       if(formKey.currentState!.validate()){
//
//                       }
//                     },
//                     child: const Text(
//                       'Sign In',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Urbanist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//         resizeToAvoidBottomInset: false,
//       ),
//     );
//   }
// }
//
// //Forget Password Screen
// class ForgetPasswordPage extends StatelessWidget {
//   static final _pageInstance = ForgetPasswordPage._internal();
//   factory ForgetPasswordPage() => _pageInstance;
//   ForgetPasswordPage._internal();
//
//   final formKey = GlobalKey<FormState>();
//   RxBool isHidden = true.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: const IconButton(
//                     onPressed: null, icon: Icon(Icons.arrow_back)),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text(
//                     'Forgot Password', style: GoogleFonts.urbanist(
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 )),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text(
//                     'Enter your email address. We will send an OTP code for verification',
//                     style: GoogleFonts.urbanist(
//                         textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         )
//                     )),
//               ),
//               Container(
//                 // color: Colors.blue,
//                   height: 180,
//                   margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                   alignment: Alignment.bottomLeft,
//                   child: Form(
//                     key: formKey,
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Positioned(
//                             left: 0,
//                             top: 0,
//                             child: Text(
//                                 'Email', style: GoogleFonts.urbanist(
//                                 textStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w800,
//                                 )
//                             ))
//                         ),
//                         Positioned(
//                             top: 10,
//                             right: 0,
//                             left: 0,
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                               ),
//                               style: GoogleFonts.urbanist(
//                                   textStyle: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w800,
//                                   )
//                               ),
//                               validator: (account) {
//                                 if (account!.isEmpty) {
//                                   return "Please enter your email";
//                                 }
//                                 if (!RegExp(r'[a-z 0-9]+@(?:gmail\.)+[a-z 0-9]')
//                                     .hasMatch(account)) {
//                                   return "Incorrect email";
//                                 }
//                               },
//                             )
//                         ),
//                       ],
//                     ),
//                   )
//               ),
//               Expanded(child: Container()),
//               Container(
//                 width: 10000,
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.all(15),
//                       backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
//                     ),
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//
//                       }
//                     },
//                     child: const Text(
//                       'Sign In',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Urbanist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//         resizeToAvoidBottomInset: false,
//       ),
//     );
//   }
// }
//
// //OTP Screen
// class OTPPage extends StatelessWidget {
//   static final _pageInstance = OTPPage._internal();
//   factory OTPPage() => _pageInstance;
//   OTPPage._internal();
//
//   String otp = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('You\'ve Got Mail', style: GoogleFonts.urbanist(
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 )),
//               ),
//               Container(
//                 margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('We have sent the OTP verification code to your email address. Check your email and enter the code below.', style: GoogleFonts.urbanist(
//                     textStyle: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     )
//                 )),
//               ),
//               Container(
//                   margin: const EdgeInsets.only(top: 21),
//                   width: 350,
//                   child: OtpForm()
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: const Text(
//                     'Din\'t receive email?'
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('You can resend code in'),
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                     child: const OTPResendCountDown(),
//                   )
//                 ],
//               ),
//               Expanded(child: Container()),
//               Container(
//                 width: 10000,
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.all(15),
//                       backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
//                     ),
//                     onPressed: (){
//
//                     },
//                     child: const Text(
//                       'Sign In',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Urbanist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//         resizeToAvoidBottomInset: false,
//       ),
//     );
//   }
// }
//
// //OTP field
// class OtpForm extends StatelessWidget {
//   OtpForm({super.key});
//
//   RxBool resendTimeout = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextFormField(
//               cursorColor: const Color.fromRGBO(248, 147, 0, 1),
//               decoration: const InputDecoration(
//                 fillColor: Color.fromRGBO(240, 240, 240, 0.3),
//                 focusColor: Color.fromRGBO(248, 147, 0, 1),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(248, 147, 0, 1)
//                     )
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(210, 210, 210, 1)
//                     )
//                 ),
//               ),
//               onChanged: (value){
//                 if(value.length == 1){
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextFormField(
//               cursorColor: const Color.fromRGBO(248, 147, 0, 1),
//               decoration: const InputDecoration(
//                 fillColor: Color.fromRGBO(240, 240, 240, 0.3),
//                 focusColor: Color.fromRGBO(248, 147, 0, 1),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(248, 147, 0, 1)
//                     )
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(210, 210, 210, 1)
//                     )
//                 ),
//               ),
//               onChanged: (value){
//                 if(value.length == 1){
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextFormField(
//               cursorColor: const Color.fromRGBO(248, 147, 0, 1),
//               decoration: const InputDecoration(
//                 fillColor: Color.fromRGBO(240, 240, 240, 0.3),
//                 focusColor: Color.fromRGBO(248, 147, 0, 1),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(248, 147, 0, 1)
//                     )
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(210, 210, 210, 1)
//                     )
//                 ),
//               ),
//               onChanged: (value){
//                 if(value.length == 1){
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 68,
//             width: 64,
//             child: TextFormField(
//               cursorColor: const Color.fromRGBO(248, 147, 0, 1),
//               decoration: const InputDecoration(
//                 fillColor: Color.fromRGBO(240, 240, 240, 0.3),
//                 focusColor: Color.fromRGBO(248, 147, 0, 1),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(248, 147, 0, 1)
//                     )
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(13)),
//                     borderSide: BorderSide(
//                         color: Color.fromRGBO(210, 210, 210, 1)
//                     )
//                 ),
//               ),
//               onChanged: (value){
//                 if(value.length == 1){
//
//                 }
//               },
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// //OTP resend countdown
// class OTPResendCountDown extends StatelessWidget {
//   const OTPResendCountDown({super.key});
//
//   Stream<String> fetchTime() async* {
//     int i = 60;
//     DateTime date;
//     while(i>-1){
//       await Future.delayed(const Duration(seconds: 1));
//       yield i.toString();
//       i--;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<String>(
//       stream: fetchTime(),
//       builder: (BuildContext context, AsyncSnapshot snapshot){
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Text(60.toString(),style: TextStyle(
//               color: Color.fromRGBO(248, 147, 0, 1),
//               fontSize: 15,
//               fontWeight: FontWeight.w800,
//               fontFamily: 'Urbanist'
//           ));
//         }
//         if((snapshot.connectionState == ConnectionState.active)){
//           if(snapshot.hasError){
//             return const Text('error',style: TextStyle(
//                 color: Color.fromRGBO(248, 147, 0, 1),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//                 fontFamily: 'Urbanist'
//             ));
//           }
//           if(snapshot.hasData){
//             return Text(snapshot.data.toString(),style: TextStyle(
//                 color: Color.fromRGBO(248, 147, 0, 1),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//                 fontFamily: 'Urbanist'
//             ));
//           }else{
//             return const Text('no data found',style: TextStyle(
//                 color: Color.fromRGBO(248, 147, 0, 1),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//                 fontFamily: 'Urbanist'
//             ));
//           }
//         }else{
//           return GestureDetector(
//             onTap: (){
//             },
//             child: const Text("here",style: TextStyle(
//                 color: Color.fromRGBO(248, 147, 0, 1),
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//                 fontFamily: 'Urbanist'
//             )),
//           );
//         }
//       },
//     );
//   }
// }
//
// //Create new password Screen
// class CreateNewPasswordPage extends StatelessWidget {
//   static final _pageInstance = CreateNewPasswordPage._internal();
//   factory CreateNewPasswordPage() => _pageInstance;
//   CreateNewPasswordPage._internal();
//
//   final formKey = GlobalKey<FormState>();
//   RxBool passwordIsHidden = true.obs;
//   RxBool confirmPasswordIsHidden = true.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('Create New Password', style: GoogleFonts.urbanist(
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 )),
//               ),
//               Container(
//                 margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                 alignment: Alignment.bottomLeft,
//                 child: Text('Enter your new password', style: GoogleFonts.urbanist(
//                     textStyle: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     )
//                 )),
//               ),
//               Container(
//                 // color: Colors.blue,
//                   height: 180,
//                   margin:  const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                   alignment: Alignment.bottomLeft,
//                   child: Form(
//                     key: formKey,
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Positioned(
//                             left: 0,
//                             top: 0,
//                             child: Text('Password', style: GoogleFonts.urbanist(
//                                 textStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w800,
//                                 )
//                             ))
//                         ),
//                         Positioned(
//                             top: 10,
//                             right: 0,
//                             left: 0,
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 suffixIcon: GestureDetector(onTap: (){
//                                   passwordIsHidden.value = !passwordIsHidden.value;
//                                 },
//                                   child: Obx(
//                                           () => passwordIsHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
//                                   ),
//                                 ),
//                                 focusedBorder: const UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(248, 147, 0, 1)
//                                     )
//                                 ),
//                               ),
//                               style: GoogleFonts.urbanist(
//                                   textStyle: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w800,
//                                   )
//                               ),
//                               obscureText: passwordIsHidden.value,
//                               validator: (password){
//                                 if(password!.isEmpty){
//                                   return "Please enter your new password";
//                                 }
//                                 if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
//                                   return "Length greater than 8 and no special key";
//                                 }
//                               },
//                             )
//                         ),
//                         Positioned(
//                             top: 90,
//                             right: 0,
//                             left: 0,
//                             child: Text('Confirm Password', style: GoogleFonts.urbanist(
//                                 textStyle: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w800,
//                                 )
//                             ))),
//                         Positioned(
//                           top: 100,
//                           right: 0,
//                           left: 0,
//                           child: Obx(
//                                   () => TextFormField(
//                                 decoration: InputDecoration(
//                                   suffixIcon: GestureDetector(onTap: (){
//                                     confirmPasswordIsHidden.value = !confirmPasswordIsHidden.value;
//                                   },
//                                     child: Obx(
//                                             () => confirmPasswordIsHidden.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
//                                     ),
//                                   ),
//                                   focusedBorder: const UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(248, 147, 0, 1)
//                                       )
//                                   ),
//                                   enabledBorder: const UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(248, 147, 0, 1)
//                                       )
//                                   ),
//                                 ),
//                                 style: GoogleFonts.urbanist(
//                                     textStyle: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w800,
//                                     )
//                                 ),
//                                 obscureText: confirmPasswordIsHidden.value,
//                                 validator: (password){
//                                   if(password!.isEmpty){
//                                     return "Please re-enter your password";
//                                   }
//                                   if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
//                                     return "Length greater than 8 and no special key";
//                                   }
//                                 },
//                               )),
//                         ),
//                       ],
//                     ),
//                   )
//               ),
//
//               Expanded(child: Container()),
//               Container(
//                 width: 10000,
//                 margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.all(15),
//                       backgroundColor: const Color.fromRGBO(248, 147, 0, 1),
//                     ),
//                     onPressed: (){
//                       if(formKey.currentState!.validate()){
//
//                       }
//                     },
//                     child: const Text(
//                       'Sign In',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Urbanist',
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//         resizeToAvoidBottomInset: false,
//       ),
//     );
//   }
// }