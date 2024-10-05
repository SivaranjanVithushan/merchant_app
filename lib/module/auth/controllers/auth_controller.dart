import 'package:merchant_app/module/auth/model/auth_model.dart';

class AuthController {
  final AuthModel _authModel = AuthModel();

  // Form validation logic for email and password
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    const emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    if (!RegExp(emailPattern).hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> signUp(
    String email,
    String password,
    Function(String) onError,
    Function onSuccess,
  ) async {
    try {
      await _authModel.signUp(email, password);
      onSuccess();
    } catch (error) {
      onError(error.toString());
    }
  }

  // Log in method for login screen
  Future<void> login(
    String email,
    String password,
    Function(String) onError,
    Function onSuccess,
  ) async {
    try {
      await _authModel.login(email, password);
      onSuccess();
    } catch (error) {
      onError(error.toString());
    }
  }
}
