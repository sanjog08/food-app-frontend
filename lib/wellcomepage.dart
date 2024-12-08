import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/loginpage.dart';
import 'package:food_app/signuppage.dart';

class WellcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('images/sample-3.png'),
            width: double.infinity,      // Make the image take full width of the screen
            fit: BoxFit.fitWidth,
          ),
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height, // Full screen height
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Colors.transparent,  // Top is fully visible
          //         Colors.black.withOpacity(0.7),  // Bottom is darker with some opacity
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter, // Start from the bottom
              end: Alignment.topCenter, // End at the top
              colors: [
                Color(0xFFFF8C00).withOpacity(1), // Orange color (fully opaque at the bottom)
                Color(0xFFFF8C00).withOpacity(0), // White color (fully transparent at the top)
              ],
            ),
          ),),
          Padding(
          // padding: const EdgeInsets.all(30.0),
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Fast Food',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Get your favorite meals delivered quickly right to your doorstep',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // signup page call by navigating
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpPage(),),);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
                ),
                child: Text(
                  'Start with Email',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Sign in With",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                    )
                ),
                child: Text('Continue with Facebook', style: TextStyle(color: Colors.black, fontSize: 16),),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )
                ),
                child: Text('Continue with Google', style: TextStyle(color: Colors.black, fontSize: 16),),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign-in page
                      // loginPage call by navigating
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()),);
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}
