import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/pages/Wellcome_page.dart';
import 'package:journey/controllers/auth_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController=Get.put(AuthController());
  @override
  void initState() {
    
    super.initState();
    goto();
  }

  Future<void> goto()async{
    await Future.delayed(2.seconds);
    Get.off(()=>WelcomePage());
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