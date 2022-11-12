import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/components/background.dart';
import 'package:flutter_complete_guide/components/round_button.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/login_by_gmail/Sign_in.dart';
import 'package:flutter_complete_guide/phone_Otp/phone_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Welcome to Bike Service",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            RoundButton(
              text: "LOGIN BY GOOGLE",
              imageDirection: "assets/icons/google_icon.svg",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GoogleForm_SignIn();
                    },
                  ),
                );
              },
            ),
            RoundButton(
              text: "LOGIN BY PHONE",
              imageDirection: "assets/icons/phone_icon.svg",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PhoneOtpForm();
                    },
                  ),
                );
              },
            ),
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
