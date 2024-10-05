import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/auth_datasources.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final AuthDataSources _authDataSources = AuthDataSources();
  @override
  initState() {
    super.initState();
    _checkLoginStatus();
  }

// Check if user is logged in
  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await _authDataSources.isUserLoggedIn();
    if (isLoggedIn) {
      // Navigate to dashboard if the user is logged in
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } else {
      // Navigate to login if the user is not logged in
      Navigator.of(context).pushReplacementNamed('/login');
    }
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
