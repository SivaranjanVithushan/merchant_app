import 'package:flutter/material.dart';
import '../../../core/theme_data/colour_scheme.dart';
import '../../../core/theme_data/text_theme.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

      _authController.login(
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
                    ],
                  ),
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
                            'Login',
                            style: textTheme.titleSmall,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signUp');
                  },
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: textTheme.titleSmall!.copyWith(
                      color: primaryDefault,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
