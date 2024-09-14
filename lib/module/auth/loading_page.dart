import 'dart:async';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      // Navigate to your main page after the splash screen
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color if needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your merchant's logo
            Image.asset(
              'assets/images/logo.png', // Update the path to your logo image
              width: 300, // Adjust the width as needed
              height: 300, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
