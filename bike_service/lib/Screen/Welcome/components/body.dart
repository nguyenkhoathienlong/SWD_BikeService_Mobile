import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/OTP/otp_form.dart';
import 'package:flutter_complete_guide/Screen/Welcome/components/background.dart';
import 'package:flutter_complete_guide/components/or_divider.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';
import 'package:flutter_complete_guide/components/rounded_input_field.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Bike Service",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundInputField(
              hintText: "Your Phone Number",
              keyboardType: TextInputType.number,
            ),
            RoundButton(
              text: "LOGIN",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OtpForm();
                    },
                  ),
                );
              },
            ),
            OrDivier(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  imageSrc: "assets/images/gmail_icon.svg",
                  press: () {},
                ),
                SocialIcon(
                  imageSrc: "assets/images/fb.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String imageSrc;
  final Function press;
  const SocialIcon({
    Key key,
    this.imageSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          imageSrc,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
