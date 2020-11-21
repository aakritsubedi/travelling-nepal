import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/widgets.dart/aboutNepalCarousel.dart';
import 'package:travellingNepal/widgets.dart/destinationCarousel.dart';

class DefaultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          App.getText(
              'Top Destination', primaryBlack, 18.0, true, null, null, 1.5),
          GestureDetector(
              onTap: () {},
              child: App.getText(
                  'See All', linkColor, 14.0, false, null, null, null))
        ],
      ),
      SizedBox(height: 10.0),
      DestinationCarousel(),
      SizedBox(height: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          App.getText(
              'Why Nepal?', primaryBlack, 18.0, true, null, null, 1.5),
          GestureDetector(
              onTap: () {},
              child: App.getText(
                  'Explore', linkColor, 14.0, false, null, null, null))
        ],
      ),
      SizedBox(height: 10.0),
      AboutNepal()
    ]);
  }
}
