import 'dart:async';

import 'package:d_katalis_spike_geo_location/constant_message/route_name.dart';
import 'package:d_katalis_spike_geo_location/screens/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static final routeName = RouteName.MAPS_SCREEN;

  @override
  State<MapScreen> createState() => _MapScreenState();

  static getLocationPlayer() {
    return _MapScreenState.getUserLocation();
  }
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static LocationData myLocation;
  static String error;
  static Location location = new Location();

  static getUserLocation() async {
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    AddressScreen.address =
        '${first.thoroughfare}, ${first.subLocality}, ${first.locality}';
    AddressScreen.city = first.subAdminArea;
    AddressScreen.province = first.adminArea;
    AddressScreen.country = first.countryName;
    AddressScreen.postalCode = first.postalCode;
    AddressScreen.lat = first.coordinates.latitude;
    AddressScreen.lng = first.coordinates.longitude;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(AddressScreen.lat, AddressScreen.lng),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeoLocation"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                compassEnabled: true,
                myLocationEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                zoomGesturesEnabled: true,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your current location : \n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                  Text(
                    '${AddressScreen.address}, ${AddressScreen.city}, ${AddressScreen.province}, ${AddressScreen.country}, ${AddressScreen.postalCode}.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {});
                      Navigator.pushNamedAndRemoveUntil(
                          context, AddressScreen.routeName, (route) => false);
                    },
                    child: Text("Get Address"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
