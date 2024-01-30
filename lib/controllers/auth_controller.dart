import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/pages/navigation_screen.dart';
import 'package:journey/pages/otp_screen.dart';

class AuthController extends GetxController {
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isLoginPasswordShow = false;
  String? verificationId;
  int? resendToken;
  Timer? timer;
  int remainingTime = 60;

  bool isAuthUsingEmail = true;

  void toggelLoginPasswordShow() {
    isLoginPasswordShow = !isLoginPasswordShow;
    update();
  }

  void toggleAuthUsingEmail() {
    isAuthUsingEmail = !isAuthUsingEmail;
    update();
  }

  void sendOtp() {
    if (isAuthUsingEmail) {
    } else {
      phoneAuth();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        timer.cancel();
        update();
      }
    });
  }

  void phoneAuth() {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneEmailController.text,
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          this.resendToken = resendToken;

          startTimer();
          Get.to(() => OtpScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
          startTimer();
        },
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void verifyOtp(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      reset();
      Get.to(() => NavigationScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.toString());
      otpController.clear();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      otpController.clear();
    }
  }

  resendOtp() {
    phoneAuth();
  }

  reset() {
    phoneEmailController.clear();
    otpController.clear();
    isLoginPasswordShow = false;
    verificationId = null;
    resendToken = null;
    timer?.cancel();
    remainingTime = 60;
    isAuthUsingEmail = true;
    update();
  }
}
