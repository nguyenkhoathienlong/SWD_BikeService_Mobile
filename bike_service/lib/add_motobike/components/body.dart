import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Home_google_map/home.dart';
import 'package:flutter_complete_guide/add_motobike/components/Background.dart';
import 'package:flutter_complete_guide/add_motobike/components/form_add_moto.dart';
import 'package:flutter_complete_guide/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomDropdown(textline: "chọn hãng xe"),
            CustomDropdown(textline: "chọn Model"),
            RoundButton(
              text: "Thêm",
              color: Colors.red,
            ),
            RoundButton(
              text: "Hủy bỏ",
              color: Colors.grey,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
