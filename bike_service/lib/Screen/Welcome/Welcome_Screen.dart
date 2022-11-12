import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/login_page.dart';
import 'package:flutter_complete_guide/home/product_screen.dart';
import 'package:flutter_complete_guide/sign_up/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ProductScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
