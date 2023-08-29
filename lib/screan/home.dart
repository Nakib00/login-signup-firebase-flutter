
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Loginpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage_SignupPage()));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(user!.email.toString()),
      ),
    );
  }
}


