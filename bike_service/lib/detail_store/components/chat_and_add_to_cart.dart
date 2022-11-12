import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatAndAddtocart extends StatelessWidget {
  const ChatAndAddtocart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: 18,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Chat",
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/add_to_cart.svg",
              height: 18,
            ),
            label: Text(
              "Add to cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
