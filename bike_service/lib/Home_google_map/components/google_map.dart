import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Home_google_map/components/appbar_home.dart';
import 'package:flutter_complete_guide/Home_google_map/components/NavigationDrawer.dart';
import 'package:flutter_complete_guide/constrain.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home_appbar extends StatefulWidget {
  const Home_appbar({Key key}) : super(key: key);

  @override
  State<Home_appbar> createState() => _Home_appbarState();
}

class _Home_appbarState extends State<Home_appbar> {
  static const LatLng mainLocation = const LatLng(10.7675648, 106.6795008);
  static const LatLng destination = const LatLng(10.8411329, 106.8076943);

  List<LatLng> polyLineCoordinates = [];

  void getPolyPoint() async {
    PolylinePoints polyLinePoint = PolylinePoints();
    PolylineResult result = await polyLinePoint.getRouteBetweenCoordinates(
      Google_API_key,
      PointLatLng(mainLocation.latitude, mainLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polyLineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_home(),
      drawer: const NavigationDrawer(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: mainLocation,
          zoom: 14.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polyLineCoordinates,
          )
        },
        markers: {
          const Marker(
            markerId: MarkerId("source"),
            position: mainLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
      ),
    );
  }
}
