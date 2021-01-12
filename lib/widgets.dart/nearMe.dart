import 'dart:async';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/nearMe.dart';
import 'package:travellingNepal/services/nearMe.dart';
import 'package:travellingNepal/widgets.dart/weather.dart';

class NearMes extends StatefulWidget {
  @override
  _NearMesState createState() => _NearMesState();
}

class _NearMesState extends State<NearMes> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  List<NearMe> nearMePlaces = [];

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
    _getNearMePlaces();
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
          top: 5.0,
          child: Weather(),
        ),
        Positioned(
            bottom: 15.0,
            child: Container(
              height: 125.0,
              width: MediaQuery.of(context).size.width - 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nearMePlaces.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _gotoLocation(double.parse(nearMePlaces[index].lat),
                          double.parse(nearMePlaces[index].lon));
                    },
                    child: Container(
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          new BoxShadow(color: Colors.grey, blurRadius: 0.0),
                        ],
                        color: Colors.grey[50],
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nearMePlaces[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                              overflow: TextOverflow.ellipsis),
                          Row(
                            children: [
                              Icon(Icons.card_travel_sharp, size: 10.0),
                              SizedBox(width: 3.0),
                              Text(
                                nearMePlaces[index].type,
                                style: TextStyle(fontSize: 10.0),
                              ),
                              SizedBox(width: 5.0),
                              Icon(Icons.add_location, size: 10.0),
                              SizedBox(width: 1.0),
                              Text(
                                '${nearMePlaces[index].distanceBetween.toString().substring(0,4)}km',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              nearMePlaces[index].desc.length != 0
                                  ? nearMePlaces[index].desc + ' ...'
                                  : '',
                              style: TextStyle(fontSize: 10.0),
                              overflow: TextOverflow.clip),
                          SizedBox(height: 3.0),
                          Text(nearMePlaces[index].placeName ?? '',
                              style:
                                  TextStyle(fontSize: 6.0, color: primaryGrey),
                              overflow: TextOverflow.fade),
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
              margin: EdgeInsets.only(bottom: 375.0),
              child: Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
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

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a.abs()), sqrt((1 - a).abs()));
    var d = R * c; // Distance in km

    return d;
  }

  double deg2rad(deg) {
    return deg * (pi / 180);
  }

  void _computeDistanceBetween() {
    nearMePlaces.forEach((place) {
      double lat1 = double.parse(place.lat);
      double lon1 = double.parse(place.lon);

      double lat2 = _center.latitude;
      double lon2 = _center.longitude;

      place.distanceBetween = getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2);
    });
  }

  void _sortMyNearMePlaces() {
    nearMePlaces.sort((p1,p2) => p1.distanceBetween.compareTo(p2.distanceBetween));
  }
  void _topNearMe(counter) {
    nearMePlaces = nearMePlaces.sublist(0,counter);
  }

  void _getNearMePlaces() async {
    List<NearMe> nearMePlaces = await NearMeServices.fetchAllNearMe();
    
    setState(() {
      this.nearMePlaces = nearMePlaces;
    });
    _computeDistanceBetween();
    _sortMyNearMePlaces();
    _topNearMe(25);
  }
}
