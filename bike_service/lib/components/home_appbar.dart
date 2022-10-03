import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/HomePage/home.dart';
import 'package:flutter_complete_guide/add_motobike/add_moto.dart';

class Home_appbar extends StatelessWidget {
  const Home_appbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

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

  buildHeader(BuildContext context) {
    return Container();
  }

  buildMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('User'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.motorcycle_sharp),
            title: const Text("Quản lý phương tiện"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddMotobike(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Cài đặt'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Home(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
