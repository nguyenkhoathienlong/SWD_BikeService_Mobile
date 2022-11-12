import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constrain.dart';

import 'components/body.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";
  final String value;

  const SignUpScreen({Key key, this.value}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        titleSpacing: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Body(
        value: "${widget.value}",
      ),
    );
  }
}
