
import 'package:d_katalis_spike_geo_location/screens/address_screen.dart';
import 'package:d_katalis_spike_geo_location/screens/map_screen.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AddressScreen.routeName,
      routes: {
        MapScreen.routeName: (context) => MapScreen(),
        AddressScreen.routeName: (context) => AddressScreen(),
      },
    );
  }
}