import 'package:flutter/material.dart';

import 'package:travellingNepal/app.dart';

class TabMenu extends StatelessWidget {

  final int index;
  final Function setIndex;

  TabMenu({ this.index, this.setIndex });

  final List<IconData> menus = [
    Icons.local_airport,
    Icons.hotel,
    Icons.directions_walk,
    Icons.motorcycle_rounded
  ];

  Widget buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setIndex(index);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: this.index == index ? primaryColor : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          menus[index],
          size: 25.0,
          color: this.index == index ? primaryWhite : secondaryColor,
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
              .map((MapEntry map) => buildIcons(map.key))
              .toList(),
        ));
  }
}
