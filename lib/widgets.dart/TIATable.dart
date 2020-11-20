import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_bar_button/toggle_bar_button.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/widgets.dart/flightTable.dart';

class TIATable extends StatelessWidget {
  final List arrivals;
  final List departure;

  TIATable({this.arrivals, this.departure});

  @override
  Widget build(BuildContext context) {
    return ToggleBarButton(
      backgroundColor: primaryWhite,
      textColor: primaryGrey,
      selectedBackgroundColor: primaryWhite,
      selectedTextColor: primaryBlack,
      borderColor: primaryWhite,
      borderWidth: 1.0,
      radius: 0.0,
      tabItems: ["Domestic Flight", "International Flight"],
      tabContentItems: <Widget>[
        FlightTable(
          arrivals: arrivals.where((arr) => arr['IntDom'] == '0').toList(),
          departure: departure.where((arr) => arr['IntDom'] == '0').toList(),
        ),
        FlightTable(
          arrivals: arrivals.where((arr) => arr['IntDom'] == '1').toList(),
          departure: departure.where((arr) => arr['IntDom'] == '1').toList(),
        ),
      ],
    );
  }
}
