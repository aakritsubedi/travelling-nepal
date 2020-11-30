import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travellingNepal/models/nearMe.dart';

class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  String _otherInfo;
  String _postalCode;
  String _district;

  Completer<GoogleMapController> _controller = Completer();

  static LatLng _center;

  Set<Marker> _marker;

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  void initState() {
    _getCurrentLocation();
    _getAddressFromLatLng();
    super.initState();
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _disposeController() async {
    final GoogleMapController controller = await _controller.future;
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: (_center != null || _marker != null)
              ? _buildMap(_center)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Positioned(
            bottom: 15.0,
            child: Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width -25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nearMePlaces.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _gotoLocation(
                          nearMePlaces[index].lat, nearMePlaces[index].lng);
                    },
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          new BoxShadow(color: Colors.grey, blurRadius: 0.0),
                        ],
                        color: Colors.grey[50],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nearMePlaces[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                          Row(
                            children: [
                              Icon(Icons.card_travel_sharp, size: 10.0),
                              SizedBox(width: 3.0),
                              Text(nearMePlaces[index].type, style: TextStyle(fontSize: 10.0),)
                            ],
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            nearMePlaces[index].desc,
                            style: TextStyle(fontSize: 12.0),
                          ),    
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
        GestureDetector(
          onTap: () {
            _gotoLocation(_center.latitude, _center.longitude);
          },
          child: Container(
              margin: EdgeInsets.only(bottom: 400.0),
              child: Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          new BoxShadow(color: Colors.grey, blurRadius: 20.0),
                        ],
                        color: Colors.white,
                      ),
                      height: 110,
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            'Your current location is',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _currentAddress ?? 'Getting your location',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            _otherInfo ?? 'gathering extra information',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            _postalCode ?? 'gathering postal code information',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )))),
        ),
      ]),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _center = LatLng(_currentPosition.latitude, _currentPosition.longitude);
        _marker = {
          Marker(
            markerId: MarkerId('Your Location'),
            position: _center,
            infoWindow: InfoWindow(title: 'You are currently here...'),
          ),
        };
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _district = place.locality;
        _currentAddress =
            "${place.subLocality}, ${place.locality}, ${place.country}";
        _otherInfo = "${place.name}, ${place.subAdministrativeArea}";
        _postalCode = "Postal Code: ${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }

  _buildMap(center) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition:
          CameraPosition(target: center, zoom: 17.0, tilt: 20.0),
      mapType: _currentMapType,
      markers: _marker,
      onCameraMove: _onCameraMove,
      myLocationButtonEnabled: true,
      compassEnabled: true,
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 17,
      tilt: 30.0,
      bearing: 10.0,
    )));
  }
}