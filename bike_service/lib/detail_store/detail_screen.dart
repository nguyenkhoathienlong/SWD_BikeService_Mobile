import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/detail_store/components/body.dart';
import 'package:flutter_complete_guide/models/store.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  final Store store;

  const DetailScreen({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppbar(context),
      body: Body(
        store: store,
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: 20),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/add_to_cart.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}
