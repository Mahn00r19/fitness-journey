import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/controllers/auth_controller.dart';

import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AuthController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                  'Enter the 6-digit code sent to you at ${controller.phoneEmailController.text}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20.0),
              Pinput(
                controller: controller.otpController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                length: 6,
                onCompleted: (pin) {
                  controller.verifyOtp(pin);
                },
              ),
              SizedBox(height: 20.0),
              controller.remainingTime > 0
                  ? Text('Resend OTP in ${controller.remainingTime} seconds')
                  : TextButton(
                      onPressed: () {
                        // controller.resendOtp();
                      },
                      child: Text('Resend OTP')),
            ],
          ),
        );
      }),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Color.fromRGBO(234, 239, 243, 1),
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  get focusedPinTheme => defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
        borderRadius: BorderRadius.circular(8),
      );

  get submittedPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          color: Color.fromRGBO(234, 239, 243, 1),
        ),
      );
}
