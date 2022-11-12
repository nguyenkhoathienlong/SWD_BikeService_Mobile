import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/login_by_gmail/components/body_SignUp.dart';

class GoogleForm_SignUp extends StatelessWidget {
  const GoogleForm_SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUp_body());
  }
}
