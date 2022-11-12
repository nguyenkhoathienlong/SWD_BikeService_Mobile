import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screen/Welcome/login_page.dart';
import 'package:flutter_complete_guide/components/default_button.dart';
import 'package:flutter_complete_guide/components/socal_card.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/phone_Otp/phone_input.dart';
import 'package:flutter_complete_guide/size_config.dart';
import 'package:get/get.dart';

import 'sign_up_form.dart';

class Body extends StatefulWidget {
  String value;
  Body({Key key, this.value}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("check phone: " + widget.value);
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20 * size.width)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04), // 4%
              Text("Register Account", style: headingStyle),
              Text(
                "Complete your details information",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.08),
              SignUpForm(value: widget.value),
              SizedBox(height: size.height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalCard(
                    icon: "assets/images/fb.svg",
                    press: () {},
                  ),
                  SocalCard(
                    icon: "assets/images/gmail_icon.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20 * size.height)),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              DefaultButton(
                  text: "Back to Login",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
