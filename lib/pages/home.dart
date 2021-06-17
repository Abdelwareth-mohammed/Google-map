import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myMarkers = HashSet<Marker>();
  BitmapDescriptor customMarker;
  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/images/abdo.jpg");
  }

  @override
  void initState() {
    super.initState();
    getCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(" Goole maps app "),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController googleMapController) {
          setState(() {
            myMarkers.add(Marker(
              markerId: MarkerId('1'),
              position: LatLng(30.033333, 31.233334),
              infoWindow: InfoWindow(
                  title: " cairo egypt",
                  snippet: "the city of thousand mousqe",
                  onTap: () {
                    print("we in cairo");
                  }),
              // icon: customMarker
            ));
          });
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 15),
        markers: myMarkers,
      ),
    );
  }
}
