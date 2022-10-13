import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundButton({
    Key key,
    this.text,
    this.press,
    @required this.color,
    this.textColor = Colors.white,
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
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
            ),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}
