import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/screens/Airport.dart';

class TravellingOptions extends StatelessWidget {

  final int index;
  
  TravellingOptions({ this.index });

  @override
  Widget build(BuildContext context) {
    final List<String> menuTitle = [
      'Airlines',
      'Hotels',
      'Explore Walking',
      'Hire Vehicles'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitle[index]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if(index == 0) Airport()
          ]
        ),
      )
    );
  }
}