import 'package:flutter/material.dart';
import 'package:merchant_app/core/theme_data/colour_scheme.dart';
import 'package:merchant_app/module/auth/controllers/auth_controller.dart';

import '../../../core/theme_data/text_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthController _authController = AuthController();
  bool _isAgreeToTermsChecked = false;
  bool _isLoading = false;

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_isAgreeToTermsChecked) {
        _showErrorSnackBar('You must agree to the terms');
        return;
      }

      setState(() {
        _isLoading = true;
      });

      _authController.signUp(
        _emailController.text,
        _passwordController.text,
        (errorMessage) {
          setState(() {
            _isLoading = false;
          });
          _showErrorSnackBar(errorMessage);
        },
        () {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context).pushReplacementNamed('/dashboard');
        },
      );
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Image.asset(
                  'assets/images/logo.png', // Update the path to your logo image
                  width: 120.0,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email TextField
                      TextFormField(
                        controller: _emailController,
                        style: textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 24,
                            color: Color(0xff6C6868),
                          ),
                          hintText: 'Enter your email',
                          hintStyle: textTheme.titleSmall!.copyWith(
                            color: const Color(0xff7C7070).withOpacity(0.5),
                          ),
                        ),
                        validator: _authController.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      // Password TextField
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 24,
                            color: Color(0xff6C6868),
                          ),
                          hintText: 'Enter your password',
                          hintStyle: textTheme.titleSmall!.copyWith(
                            color: const Color(0xff7C7070).withOpacity(0.5),
                          ),
                        ),
                        validator: _authController.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password TextField
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        style: textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 24,
                            color: Color(0xff6C6868),
                          ),
                          hintText: 'Confirm your password',
                          hintStyle: textTheme.titleSmall!.copyWith(
                            color: const Color(0xff7C7070).withOpacity(0.5),
                          ),
                        ),
                        validator: (value) =>
                            _authController.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _isAgreeToTermsChecked,
                      onChanged: (value) {
                        setState(() {
                          _isAgreeToTermsChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Agree to terms and conditions',
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
                            'Sign Up',
                            style: textTheme.titleSmall,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: Text(
                    'if you have an account? Login',
                    style: textTheme.titleSmall!.copyWith(
                      color: primaryDefault,
                    ),
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
