// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthDataSources {
//   late SharedPreferences prefs;

//   Future<User?> getUserData() async {
//     prefs = await SharedPreferences.getInstance();
//     String? jsonStringFromPrefs = prefs.getString('userData');
//     if (jsonStringFromPrefs != null) {
//       // print('User data found in SharedPreferences: $jsonStringFromPrefs');
//       Map<String, dynamic> json = jsonDecode(jsonStringFromPrefs);
//       User? user = User.fromJson(json);
//       // print('User data parsed from JSON: $user');
//       return user;
//     } else {
//       // print('No user data found in SharedPreferences');
//       return null;
//     }
//   }

//   Future<bool> isUserLoggedIn() async {
//     User? user = await getUserData();
//     if (user != null) {
//       if (user.token != null) {
//         // print('User is logged in');
//         return true;
//       }
//     }

//     // print('User is not logged in');
//     return false;
//   }

//   Future<String?> getToken() async {
//     User? user = await getUserData();
//     if (user != null) {
//       // print('User token found: ${user.token}');
//       return user.token;
//     }

//     // print('User token not found');
//     return null;
//   }
// }
