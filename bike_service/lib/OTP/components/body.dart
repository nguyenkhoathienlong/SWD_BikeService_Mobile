import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/components/background.dart';
import 'package:flutter_complete_guide/components/size_box_otp.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/home/product_screen.dart';
import '../../components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizeBoxOtp("Otp1"),
                  SizeBoxOtp("Otp2"),
                  SizeBoxOtp("Otp3"),
                  SizeBoxOtp("Otp4"),
                ],
              ),
            ),
            RoundButton(
              text: "Summit",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductScreen();
                    },
                  ),
                );
              },
            ),
            RoundButton(
              text: "Resend",
              press: () {},
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
