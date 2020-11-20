import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/services/airport.dart';
import 'package:travellingNepal/widgets.dart/TIATable.dart';

class Airport extends StatefulWidget {
  @override
  _AirportState createState() => _AirportState();
}

class _AirportState extends State<Airport> {
  List arrivals;
  List departure;

  getFlightInfo() async {
    Map flightInfo = await AirportService.getFlightInfo();

    setState(() {
      arrivals = flightInfo['arrivals'];
      departure = flightInfo['departure'];
    });
  }

  @override
  void initState() {
    getFlightInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      onPressed: () {
        openBottomSheet(context, arrivals, departure);
      },
      child: Text('My Airport'),
    ));
  }
}

void openBottomSheet(context, List arrivals, List departure) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
            color: Colors.transparent,
            child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    height: 400.0,
                    child:
                        TIATable(arrivals: arrivals, departure: departure))));
      });
}
