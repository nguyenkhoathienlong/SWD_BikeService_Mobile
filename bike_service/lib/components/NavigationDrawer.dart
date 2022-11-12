import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Home_google_map/home.dart';
import 'package:flutter_complete_guide/Screen/Welcome/login_page.dart';
import 'package:flutter_complete_guide/add_motobike/add_moto.dart';
import 'package:flutter_complete_guide/home/product_screen.dart';
import 'package:flutter_complete_guide/models/customer.dart';
import 'package:flutter_complete_guide/service/Auth_servicea.dart';
import 'package:flutter_complete_guide/sign_up/sign_up_screen.dart';

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
    //final user = FirebaseAuth.instance.currentUser;
    AuthClass auth = AuthClass();
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Icon(Icons.phone),
            /*child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL),
              
            ),*/
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Gmail: " /*+ user.email*/,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text("Trang chính"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductScreen(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text("Quản lý tài khoản"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ));
            },
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
            leading: const Icon(Icons.location_on),
            title: const Text("Vị trí của bạn"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Home(),
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
            onTap: () async {
              await auth.Logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => LoginScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
