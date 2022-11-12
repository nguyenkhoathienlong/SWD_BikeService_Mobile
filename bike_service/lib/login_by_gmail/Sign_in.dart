import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/login_by_gmail/components/body_SignIn.dart';

class GoogleForm_SignIn extends StatelessWidget {
  const GoogleForm_SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn_body(),
    );
  }
}
