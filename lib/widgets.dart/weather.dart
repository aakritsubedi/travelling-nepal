import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travellingNepal/models/weather.dart';
import 'package:travellingNepal/services/weather.dart';

class WeatherBox extends StatefulWidget {
  @override
  _WeatherBoxState createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  Weather _weatherData;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _weatherData != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network('https://www.weatherbit.io/static/img/icons/${_weatherData.info["icon"]}.png', height: 60.0, width: 60.0,),
                  SizedBox(width: 5.0),
                  Column(children: [
                    Text(
                      '${_weatherData.temp}°C' ?? '__°C',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    Text(
                      '${_weatherData.info["description"]}' ?? 'Loading...',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    ),
                    Text(_weatherData.city ?? 'Nepal',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                  ])
                ],
              )
            ],
          )
        : Container(
            child: Text('Loading...'),
          );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getTemperature();
    }).catchError((e) {
      print(e);
    });
  }

  _getTemperature() async {
    Weather currentTemp = await WeatherService.getWeatherInfo(
        _currentPosition.latitude, _currentPosition.longitude);

    setState(() {
      _weatherData = currentTemp;
    });
  }
}
