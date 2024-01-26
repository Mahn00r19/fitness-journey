// lib/registration_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello! Register to get Started',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            _buildTextField('Email'),
            _buildTextField('Password', isPassword: true),
            _buildTextField('Confirm Password', isPassword: true),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add registration logic here
              },
              child: Text('Register'),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?'),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    // Navigate to the login page
                    Get.off(()=>LoginPage());
                  },
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}
