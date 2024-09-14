import 'package:flutter/material.dart';

import '../../core/theme_data/colour_scheme.dart';
import '../../core/theme_data/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'vithushan@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '111111111');
  bool _isRememberMeChecked = false;
  bool _isLoading = false;

  // Email Validation Logic
  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    final emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password Validation Logic
  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
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
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                    children: [
                      // Email TextField
                      TextFormField(
                        controller: _emailController,
                        style:
                            textTheme.titleSmall!.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email_outlined,
                              size: 24,
                              color: Color(0xff6C6868),
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: textTheme.titleSmall!.copyWith(
                              color: const Color(0xff7C7070).withOpacity(0.5)),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 20),
                      // Password TextField
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style:
                            textTheme.titleSmall!.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/password.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          hintText: 'Enter your password',
                          hintStyle: textTheme.titleSmall!.copyWith(
                              color: const Color(0xff7C7070).withOpacity(0.5)),
                        ),
                        validator: _validatePassword,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Remember Me Checkbox
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(
                        width: 1.5,
                        color: Color(0xff666666),
                      ),
                      value: _isRememberMeChecked, // Default is checked
                      onChanged: (value) {
                        setState(() {
                          _isRememberMeChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Remember Me',
                      style: textTheme.titleSmall!
                          .copyWith(color: const Color(0xff666666)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

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
                            'Log In',
                            style: textTheme.titleSmall,
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                // Forgot Password Link
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/forgot-password');
                  },
                  child: Text(
                    'Forgot password?',
                    style: textTheme.titleSmall!.copyWith(
                      color: const Color(0xff7294EB),
                    ),
                  ),
                ),
                // Image Placeholder at the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/gif/delivery.gif', // Replace with your asset path
                    width: 248,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
