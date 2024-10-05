import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../../../core/theme_data/colour_scheme.dart';
import '../../../core/theme_data/text_theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = AuthController();
  bool _isLoading = false;

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _authController.sendPasswordResetEmail(
        _emailController.text,
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Check your email at ${_emailController.text} for password reset instructions.',
              ),
            ),
          );
        },
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
          onTap: () =>
              FocusScope.of(context).unfocus(), // To dismiss the keyboard
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Image.asset(
                    'assets/images/logo.png', // Update the path to your logo image
                    width: 120.0,
                  ),
                  const SizedBox(height: 20),
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
                          validator: _authController.validateEmail,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
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
