import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/components/google_map_start.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MapSample(),
    );
  }
}
