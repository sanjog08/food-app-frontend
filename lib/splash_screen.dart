import 'dart:async';
import 'package:flutter/material.dart';
import 'auth_wraper.dart';
import 'mainpage.dart';

const Color clr1 = Color(0xFFEEEEEE); // Background color
const Color clr4 = Color(0xFFFFA500); // Text color

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    // Timer to navigate after 4 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthWrapper(authenticatedScreen: MainPage())) // Replace MainPage() with your target screen
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: clr1,  // Background color
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: _offsetAnimation.value,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Text(
                    'Food App',  // You can replace this with your logo or name
                    style: TextStyle(
                      color: clr4,
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}











// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
// const Color clr1 = Color(0xFFEEEEEE);
// const Color clr2 = Color(0xFF616161);
// const Color clr3 = Color(0xFF2196F3);
// const Color clr4 = Color(0xFFFFA500);
//
// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//
//     _offsetAnimation = Tween<Offset>(
//       begin: Offset(0, -1),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//
//     _controller.forward();
//
//     Timer(Duration(seconds: 4), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => zerodha_clone()));
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: clr1,
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (BuildContext context, Widget? child) {
//               return Transform.translate(
//                 offset: _offsetAnimation.value,
//                 child: Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Text(
//                     'TradeTrial',
//                     style: TextStyle(color: clr4, fontSize: 44, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }











