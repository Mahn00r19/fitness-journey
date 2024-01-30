import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/controllers/auth_controller.dart';
import 'package:journey/pages/auth_screen.dart';
import 'package:journey/pages/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    goto();
  }

  Future<void> goto() async {
    await Future.delayed(2.seconds);
    if (FirebaseAuth.instance.currentUser == null) {
      Get.off(() => AuthScreen());
    } else {
      Get.off(() => NavigationScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for your logo, adjust the path and size accordingly
            Image.asset(
              'assets/logo.png',
              height: 150.0,
              width: 150.0,
            ),
            SizedBox(height: 20.0),
            Text('Fitness Journey'),
          ],
        ),
      ),
    );
  }
}
