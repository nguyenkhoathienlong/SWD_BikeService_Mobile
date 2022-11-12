import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final String imageDirection;
  const RoundButton({
    Key key,
    this.text,
    this.press,
    @required this.color,
    this.textColor = Colors.white,
    this.imageDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: ElevatedButton.icon(
            onPressed: press,
            icon: SvgPicture.asset(
              imageDirection,
              height: 18,
            ),
            label: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
