import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/home_appbar.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Home_appbar(),
        ],
      ),
    );
  }
}
