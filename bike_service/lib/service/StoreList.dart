import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/detail_store/detail_screen.dart';
import 'package:flutter_complete_guide/home/components/store_card.dart';
import 'package:flutter_complete_guide/models/store.dart';

class StoreList extends StatelessWidget {
  final List<Store> store;

  const StoreList({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //product list here
      itemCount: store == null ? 0 : store.length,
      itemBuilder: (context, index) => StoreCard(
        itemIndex: store.length,
        store: store[index],
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(store: store[index]),
            ),
          );
        },
      ),
    );
  }
}
