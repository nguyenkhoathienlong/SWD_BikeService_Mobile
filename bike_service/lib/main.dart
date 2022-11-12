import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/Welcome_Screen.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_complete_guide/service/google_sign_in.dart';
import 'package:provider/provider.dart';

Timer _rootTimer;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
