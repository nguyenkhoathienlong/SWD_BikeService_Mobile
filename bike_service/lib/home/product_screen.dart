import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/NavigationDrawer.dart';
import 'package:flutter_complete_guide/home/components/body.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      appBar: Appbar(),
      drawer: NavigationDrawer(),
      body: Body(),
    );
  }

  AppBar Appbar() {
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
