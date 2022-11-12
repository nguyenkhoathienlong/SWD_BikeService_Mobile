import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_complete_guide/detail_store/components/List_colors.dart';
import 'package:flutter_complete_guide/detail_store/components/chat_and_add_to_cart.dart';
import 'package:flutter_complete_guide/detail_store/components/product_picture.dart';
import 'package:flutter_complete_guide/models/store.dart';

class Body extends StatelessWidget {
  final Store store;
  const Body({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //dung de lăn màn hình với màn hình nhỏ
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${store.name}',
                      child: ProductPoster(
                        size: size,
                        image: "assets/images/mechanic.jpg",
                      ),
                    ),
                  ),
                  ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      store.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    store.phoneNumber,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      store.address,
                      style: TextStyle(
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            ChatAndAddtocart(),
          ],
        ),
      ),
    );
  }
}
