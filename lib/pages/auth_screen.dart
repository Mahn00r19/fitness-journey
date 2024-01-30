import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GetBuilder<AuthController>(builder: (controller) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Whats your ${controller.isAuthUsingEmail ? 'email' : 'phone number'}?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: controller.phoneEmailController,
                  keyboardType: controller.isAuthUsingEmail
                      ? TextInputType.emailAddress
                      : TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your ${controller.isAuthUsingEmail ? 'email' : 'phone number'}';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: controller.isAuthUsingEmail
                        ? 'Enter your email'
                        : 'Enter your phone number',
                    suffixIcon: Icon(
                      controller.isAuthUsingEmail
                          ? Icons.email_outlined
                          : Icons.phone,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      controller.toggleAuthUsingEmail();
                    },
                    child: Text(
                        'Continue with ${controller.isAuthUsingEmail ? 'phone number' : 'email'}')),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.sendOtp();
                      }
                    },
                    child: Text('Proceed')),
              ],
            ),
          );
        }),
      ),
    );
  }
}
