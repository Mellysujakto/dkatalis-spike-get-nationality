import 'package:d_katalis_spike_geo_location/constant_message/route_name.dart';
import 'package:d_katalis_spike_geo_location/screens/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  static final routeName = RouteName.ADDRESS_SCREEN;

  static double lat;
  static double lng;
  static String address;
  static String city;
  static String province;
  static String country;
  static String postalCode;

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      MapScreen.getLocationPlayer();
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width / 2.8,
                    margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Text(
                      "ABOUT ME",
                      style: TextStyle(fontSize: 25.0, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    child: Text(
                      "Please input your valid address into form below or get your current location data using google maps.",
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MapScreen.routeName);
                    },
                    title: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.blueGrey,
                                size: 80.0,
                              ),
                              Text(
                                "Where is your \nHome?",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.home, size: 160.0, color: Colors.blueGrey),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Address",
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.0, left: 1.0),
                              height: MediaQuery.of(context).size.height / 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border:
                                    Border.all(color: Colors.grey, width: 2.0),
                              ),
                              child: TextFormField(
                                maxLines: null,
                                initialValue: AddressScreen.address,
                                decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Sudirman Street',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Province",
                                style: TextStyle(fontSize: 15),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 17,
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                ),
                                child: TextFormField(
                                  initialValue: AddressScreen.province,
                                  decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'DKI Jakarta',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "City",
                                style: TextStyle(fontSize: 15),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 17,
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                ),
                                child: TextFormField(
                                  initialValue: AddressScreen.city,
                                  decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'South Jakarta',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Country",
                                style: TextStyle(fontSize: 15),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 17,
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                ),
                                child: TextFormField(
                                  initialValue: AddressScreen.country,
                                  decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Indonesia',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Postal Code",
                                style: TextStyle(fontSize: 15),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: MediaQuery.of(context).size.height / 17,
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                ),
                                child: TextFormField(
                                  initialValue: AddressScreen.postalCode,
                                  decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: '17511',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                    height: MediaQuery.of(context).size.height / 17,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.yellow[700],
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
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
