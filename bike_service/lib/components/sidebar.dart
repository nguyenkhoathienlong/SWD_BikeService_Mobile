import 'package:flutter/material.dart';

class sideBar extends StatelessWidget {
  const sideBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {}

  buildMenuItems(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Home"),
          onTap: () {},
        ),
      ],
    );
  }
}
