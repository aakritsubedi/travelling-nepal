import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/destination.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          Destination destination = destinations[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 210.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 120.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color: primaryWhite,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          App.getText(
                              '${destination.activities.length} Activities',
                              primaryBlack,
                              22.0,
                              true,
                              null,
                              null,
                              1.2),
                          App.getText('${destination.description} ',
                              primaryGrey, 14.0, false, null, null, null),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                            height: 180.0,
                            width: 180.0,
                            image: NetworkImage(destination.imageUrl),
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            App.getText('${destination.city}', primaryWhite, 20.0,
                                true, null, null, 1.2),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 14.0, color: primaryWhite,),
                                SizedBox(width: 5.0),
                                App.getText('${destination.country}', primaryWhite, 14.0,
                                    true, null, null, 0.8),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
