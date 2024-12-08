import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loginpage.dart';
import 'dart:convert';



class AuthService {
  final String baseUrl = 'https://food-app-backend-bice.vercel.app/signup';

  // Signup Function
  Future<void> signup(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl');

    print('Requesting URL: $url'); // Debugging: Print the final URL

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('User registered successfully');
      } else if (response.headers['content-type']?.contains('application/json') == true) {
        // Parse JSON error message
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        throw Exception('Error: $error');
      } else {
        // Handle non-JSON responses
        throw Exception('Unexpected response: ${response.body}');
      }
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }
}




class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isloading = false;

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
           message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void signup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      print('All fields are required');
      showError('Please fill all fields');
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      print('Enter a valid email address');
      showError('Enter a valid email address!');

      return;
    }

    setState(() => _isloading = true);

    try {
      await _authService.signup(name, email, password);
      print('User registered successfully');
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Signup failed: $e');
      showError(e.toString());
    } finally {
      setState(() => _isloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('I deployed my backend on free version of vercel, if SIGNUP button not working, then LOGIN with:\n'
                      'Email: sanjogbhatia8@gmail.com\nPassword: sanjog@08'),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SignUp', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Name', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Email', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Create Password', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // TextButton(
              //   onPressed: () {
              //     // submit call
              //     // signup function call
              //     signup();
              //   },
              //   style: TextButton.styleFrom(
              //       backgroundColor: Color(0xFFFF8C00),
              //       padding: EdgeInsets.symmetric(vertical: 7),
              //       minimumSize: Size(double.infinity, 40),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       )
              //   ),
              //   child: Text(
              //     'SignUp',
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              // ),
              _isloading
                ? Center(child: CircularProgressIndicator(),)
                :TextButton(
                onPressed: signup,
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFFF8C00),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      'Login',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
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
                  padding: EdgeInsets.symmetric(vertical: 7),
                  minimumSize: Size(double.infinity, 40),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Color(0xFFFF8C00),
                      width: 2.0,
                    ),
                  ),
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
                    side: BorderSide(
                      color: Color(0xFFFF8C00),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text('Continue with Google', style: TextStyle(color: Colors.black, fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}