import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isLoginPasswordShow=false;

  void toggelLoginPasswordShow(){
    isLoginPasswordShow=!isLoginPasswordShow;
    update();
  }
  

  void otp(String value) {}


}