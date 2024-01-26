import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journey/Wellcome_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    return  Scaffold(
      body:Center(child:
        Text('Fitness Journey')
      )
    );
  }
}