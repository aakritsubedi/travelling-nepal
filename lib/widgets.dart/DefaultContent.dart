import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/screens/previewStory.dart';
import 'package:travellingNepal/widgets.dart/aboutNepalCarousel.dart';
import 'package:travellingNepal/widgets.dart/destinationCarousel.dart';
import 'package:travellingNepal/widgets.dart/homeBanner.dart';
import 'package:travellingNepal/widgets.dart/tabMenu.dart';
import 'package:travellingNepal/widgets.dart/weather.dart';

class DefaultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherBox(),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PreviewStories()));
              },
              child: DottedBorder(
                color: secondaryColor,
                borderType: BorderType.RRect,
                radius: Radius.circular(25),
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Container(
                    decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [
                            secondaryColor,
                            primaryColor,
                          ],
                        )),
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/flag.gif',
                        height: 30.0, width: 30.0),
                  ),
                ),
              )),
        ],
      ),
      SizedBox(height: 5.0),
      Divider(height: 1.0),
      SizedBox(height: 15.0),
      HomeBanner(),
      SizedBox(height: 10.0),
      TabMenu(),
      SizedBox(height: 10.0),
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
          App.getText('Why Nepal?', primaryBlack, 18.0, true, null, null, 1.5),
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
