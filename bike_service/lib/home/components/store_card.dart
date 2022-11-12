import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/store.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    Key key,
    this.press,
    this.store,
    this.itemIndex,
  }) : super(key: key);

  final int itemIndex;
  final Store store;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: 140,
        child: InkWell(
          onTap: press,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: itemIndex.isEven
                      ? Color.fromARGB(255, 60, 134, 253)
                      : Color.fromARGB(255, 21, 243, 84),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Hero(
                  tag: '${store.name}',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 160,
                    child: Image.asset(
                      "assets/images/mechanic.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 136,
                  width: size.width - 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          store.name,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Địa chỉ: " + store.address,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          ),
                        ),
                        child: Text(
                          store.phoneNumber,
                          style: Theme.of(context).textTheme.button,
                        ),
                      )
                    ],
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
