import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/pages/splash_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text('Navigation Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Get.offAll(() => SplashScreen());
              },
              child: Text('Logout'))
        ],
      ),
    );
  }
}
