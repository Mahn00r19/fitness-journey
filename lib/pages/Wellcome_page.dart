import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'Registeration_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image at the top covering 25% of the page
            Expanded(
              flex: 25,
              child: AspectRatio(
                aspectRatio: 1, // Adjust the aspect ratio as needed
                child: Image.asset(
                  'assets/image/Welcome.PNG', 
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to Fitness Journey',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Text(
              'Crave control, conquer calories. Build smart meals, track progress, unlock your healthy best.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>LoginPage()); // Using GetX 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: Text('Login'),
            ),  
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Get.to(RegistrationPage()); // Using GetX 
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: Text('Register'),
            ),
            SizedBox(height: 40.0), // Add some space after the buttons
          ],
        ),
      ),
    );
  }
}
