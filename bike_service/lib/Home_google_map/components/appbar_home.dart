import 'package:flutter/material.dart';

class Appbar_home extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(80);
  const Appbar_home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text("Bike Service"),
      titleSpacing: 0,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      elevation: 0,
    );
  }
}
