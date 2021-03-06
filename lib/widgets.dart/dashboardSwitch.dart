import 'package:flutter/material.dart';
import 'package:travellingNepal/screens/Explore.dart';
import 'package:travellingNepal/widgets.dart/DefaultContent.dart';
import 'package:travellingNepal/widgets.dart/nearMe.dart';

class DashboardSwitch extends StatelessWidget {

  final int index;

  DashboardSwitch({ this.index });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
         if(index == 0) DefaultContent()
         else if(index == 1) Explorer()
         else if(index == 2) NearMes()
        ] 
      ),
    );
  }
}
