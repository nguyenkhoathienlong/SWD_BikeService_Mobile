import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OTP/components/body.dart';

class OtpForm extends StatefulWidget {
  final String value;
  OtpForm({Key key, this.value}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      value: "${widget.value}",
    ));
  }
}
