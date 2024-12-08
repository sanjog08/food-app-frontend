import 'package:flutter/material.dart';
import 'package:food_app/sessionmanager.dart';
import 'package:food_app/wellcomepage.dart';

// class AuthWrapper extends StatelessWidget {
//   final Widget authenticatedScreen;
//
//   AuthWrapper({required this.authenticatedScreen});
//
//   @override
//   Widget build(BuildContext context) {
//     final SessionManager sessionManager = SessionManager();
//
//     return FutureBuilder<String?>(
//       future: sessionManager.getToken(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData && snapshot.data != null) {
//           return authenticatedScreen; // Show protected screen
//         } else {
//           return WellcomePage(); // Redirect to Wellcome Page
//         }
//       },
//     );
//   }
// }








class AuthWrapper extends StatelessWidget {
  final Widget authenticatedScreen;

  AuthWrapper({required this.authenticatedScreen});

  @override
  Widget build(BuildContext context) {
    final SessionManager sessionManager = SessionManager();

    return FutureBuilder<String?>(
      future: sessionManager.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData && snapshot.data != null) {
          return authenticatedScreen; // Show the protected screen
        } else {
          return WellcomePage(); // Show the login/signup screen
        }
      },
    );
  }
}
