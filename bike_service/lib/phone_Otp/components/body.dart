import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OTP/otp_form.dart';
import 'package:flutter_complete_guide/Screen/Welcome/components/background.dart';
import 'package:flutter_complete_guide/components/round_button.dart';
import 'package:flutter_complete_guide/components/rounded_input_field.dart';
import 'package:flutter_complete_guide/constrain.dart';

class Body extends StatefulWidget {
  final GlobalKey<_BodyState> key = new GlobalKey();

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RoundInputField(
              hintText: "Nhập Số Điện Thoại",
              icon: Icons.phone,
              color: Colors.black,
              keyboardType: TextInputType.number,
              controller: _textController,
            ),
            Text(
              "Enter phone number form: +84xxxxx",
            ),
            RoundButton(
              text: "Summit",
              color: kPrimaryColor,
              imageDirection: "assets/icons/send.svg",
              press: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new OtpForm(value: _textController.text),
                );
                Navigator.of(context).push(route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
