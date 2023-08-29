import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage_SignupPage extends StatefulWidget {
  @override
  _LoginPage_SignupPageState createState() => _LoginPage_SignupPageState();
}

class _LoginPage_SignupPageState extends State<LoginPage_SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  bool _isLoading = false;

  //Login function work
  void _validateInputs() async {
    setState(() {
      _emailError = _emailController.text.isEmpty ? 'Email is required' : null;
      _passwordError =
          _passwordController.text.isEmpty ? 'Password is required' : null;
    });

    if (_emailError == null && _passwordError == null) {
      setState(() {
        _isLoading = true;
      });

      await signInWithEmailAndPassword();

      setState(() {
        _isLoading = false;
      });

      if (_emailError == null && _passwordError == null) {
        // Route the page to Home page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Successful login, you can navigate to a new screen or perform other actions
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _emailError = 'No user found for that email';
          _passwordError = null; // Clear password error
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _emailError = null; // Clear email error
          _passwordError = 'Wrong password provided for that user.';
        });
      }
    }
  }

  //Sign Up Function work
  Future<void> createUserWithEmailAndPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (credential.user != null) {
        // Route the page to Home page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailError,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _validateInputs,
              child: Text('Log in'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                minimumSize:
                    Size(double.infinity, 50), // Custom width and height
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : createUserWithEmailAndPassword,
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                minimumSize:
                    Size(double.infinity, 50), // Custom width and height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
