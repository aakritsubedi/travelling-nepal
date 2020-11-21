import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/screens/TravellingOption.dart';

class TabMenu extends StatelessWidget {
  final List<IconData> menus = [
    Icons.local_airport,
    Icons.hotel,
    // Icons.money
    // Icons.nepali_product
    Icons.directions_walk,
    Icons.motorcycle_rounded
  ];

  Widget buildIcons(context ,int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TravellingOptions(index: index)),
        );
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          menus[index],
          size: 25.0,
          color: primaryBlack,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: menus
              .asMap()
              .entries
              .map((MapEntry map) => buildIcons(context, map.key))
              .toList(),
        ));
  }
}
