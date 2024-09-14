import 'package:flutter/material.dart';

import '../../core/theme_data/colour_scheme.dart';
import '../../core/theme_data/text_theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  // Email Validation Logic
  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    const emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2)); // Mock network call

      setState(() {
        _isLoading = false;
      });
      // For now, just print success message
      // You would replace this with actual login logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Check your mail address ${_emailController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), // To dismiss the keyboard when tapping outside
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Image.asset(
                    'assets/images/logo.png', // Update the path to your logo image
                    width: 120.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Email TextField
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: textTheme.headlineSmall!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Enter your email and we\'ll send you instructions to reset your password',
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 24),
                        // Email TextField
                        TextFormField(
                          controller: _emailController,
                          style: textTheme.titleSmall!
                              .copyWith(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: textTheme.bodySmall!
                                .copyWith(color: Colors.black),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: _validateEmail,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Remember Me Checkbox

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffD6D2FA),
                          blurRadius: 8,
                          offset: Offset(-1, 1),
                          spreadRadius: 0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [primaryBorderDarker, primaryBorderLighter],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(45),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Submit',
                              style: textTheme.titleSmall,
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Forgot Password Link

                  // Image Placeholder at the bottom
                  Image.asset(
                    'assets/gif/delivery.gif', // Replace with your asset path
                    width: 248,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
