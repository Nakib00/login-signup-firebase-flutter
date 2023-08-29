import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'Loginpage.dart';
import 'home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // User is logged in
              return Home();
            } else {
              // User is not logged in
              return LoginPage_SignupPage();
            }
          } else {
            // Stream is still loading
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
