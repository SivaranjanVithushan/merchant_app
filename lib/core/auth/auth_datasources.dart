import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSources {
  late SharedPreferences prefs;

  // Save user data to SharedPreferences
  Future<void> saveUserData(User user) async {
    prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(user.toJson());
    await prefs.setString('userData', jsonString);
  }

  // Retrieve user data from SharedPreferences
  Future<User?> getUserData() async {
    prefs = await SharedPreferences.getInstance();
    String? jsonStringFromPrefs = prefs.getString('userData');
    if (jsonStringFromPrefs != null) {
      Map<String, dynamic> json = jsonDecode(jsonStringFromPrefs);
      User? user = User.fromJson(json);
      return user;
    } else {
      return null;
    }
  }

  // Check if the user is logged in
  Future<bool> isUserLoggedIn() async {
    User? user = await getUserData();
    return user != null && user.token != null;
  }

  // Get user token
  Future<String?> getToken() async {
    User? user = await getUserData();
    return user?.token;
  }

  // Clear user data (for logging out)
  Future<void> clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
  }
}

class User {
  String? token;
  String? email;

  User({this.token, this.email});

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'email': email,
    };
  }

  // Convert JSON to a User object
  static User fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      email: json['email'],
    );
  }
}
