import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/add_motobike/components/Background.dart';
import 'package:flutter_complete_guide/add_motobike/components/form_add_moto.dart';
import 'package:flutter_complete_guide/home/product_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              CustomDropdown(textline: "chọn hãng xe"),
              CustomDropdown(textline: "chọn Model"),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/accept.svg",
                        height: 18,
                      ),
                      label: Text(
                        "Thêm",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductScreen();
                            },
                          ),
                        );
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/cancel.svg",
                        height: 18,
                      ),
                      label: Text(
                        "Hủy bỏ",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
