import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/components/background.dart';
import 'package:flutter_complete_guide/components/round_button.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/service/google_sign_in.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  String value;
  Body({Key key, this.value}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int start = 30;
  bool wait = false;
  String buttonName = "get OTP";
  TextEditingController phoneController = TextEditingController();
  GoogleSignInProvider authclass = GoogleSignInProvider();
  String verificationIdFinal = "";
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    phoneController.text = widget.value.toString();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "OTP sent to " + "${widget.value}",
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  otpField(),
                ],
              ),
            ),
            Container(
              width: size.width - 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  Text(
                    "Enter 6 digit OTP",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Sent OPT again in ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "00:$start",
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
                TextSpan(
                  text: " sec",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ]),
            ),
            RoundButton(
              text: "Summit",
              color: kPrimaryColor,
              imageDirection: "assets/icons/send.svg",
              press: () {
                authclass.signInwithPhoneNumber(
                    verificationIdFinal, smsCode, context, widget.value);
              },
            ),
            RoundButton(
              text: buttonName,
              imageDirection: "assets/icons/reload.svg",
              press: wait
                  ? null
                  : () async {
                      setState(() {
                        start = 30;
                        wait = true;
                        buttonName = "Resend";
                      });
                      await authclass.verifyPhoneNumber(
                          "${phoneController.text}", context, setData);
                    },
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: 280,
      fieldWidth: 40,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xff1d1d1d),
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    // ignore: unused_local_variable
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
