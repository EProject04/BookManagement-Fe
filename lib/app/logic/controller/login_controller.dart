import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginController extends GetxController{
  RxBool isHidden = true.obs;
  String? usernameValidate(String? username){
    if(username!.isEmpty){
      return "Please enter your phone number";
    }
    if(!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(username)){
      return "Incorrect phone number";
    }
  }
  String? passwordValidate(String? password){
    if(password!.isEmpty){
      return "Please enter your password";
    }
    if(password.length < 8 || RegExp(r'[!#$%&*"+/=?^_`{|}~-]').hasMatch(password)){
      return "Length greater than 8 and no special key";
    }
  }
  void login(String phoneNumber, String password){
    print(phoneNumber);
    print(password);
  }
}
