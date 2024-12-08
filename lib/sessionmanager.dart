import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // Save the token
  Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  // Retrieve the token
  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('auth_token');
    } catch (e) {
      print('Error retrieving token: $e');
      return null;
    }
  }

  // Clear the token (logout)
  Future<void> clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
    } catch (e) {
      print('Error clearing token: $e');
    }
  }
}



// class SessionManager {
//   // Save the token
//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('auth_token', token);
//   }
//
//   // Retrieve the token
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('auth_token');
//   }
//
//   // Clear the token (logout)
//   Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('auth_token');
//   }
// }
