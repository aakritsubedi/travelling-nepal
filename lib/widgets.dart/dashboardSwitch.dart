import 'package:flutter/material.dart';
import 'package:travellingNepal/widgets.dart/DefaultContent.dart';
import 'package:travellingNepal/widgets.dart/airport.dart';

class DashboardSwitch extends StatelessWidget {

  final int index;

  DashboardSwitch({ this.index });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0
      ),
      child: Column(
        children: [
         if(index == -1) DefaultContent()
         else if(index == 0) Airport()
        ] 
      ),
    );
  }
}