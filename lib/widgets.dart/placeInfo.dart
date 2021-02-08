import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/explorer.dart';

class PlaceInfo extends StatelessWidget {
  final Explorer place;

  PlaceInfo({this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: primaryBlack)),
                  Text(place.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: primaryBlack)),
                  Text(place.category,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: primaryBlack))
                ],
              ),
              place.imageUrl.length != 0
                  ? Image.network(
                      place.imageUrl,
                      height: 50.0,
                      width: 50.0,
                    )
                  : Image.asset(
                      'assets/images/header-bg.png',
                      height: 50.0,
                      width: 50.0,
                    ),
            ],
          ),
          Text(
            place.description,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: primaryBlack,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10.0),
          Text('- 18mins drive from your location'),
          Text('- 5.6KM away from your location'),
          Text('- Today\'s Weather: 26°C'),
          Text('Transportation'),
          Text('- You can take Sajha yatayat and Microbus'),
          Text('or you can book a cab to ${place.name}'),
        ],
      ),
    );
  }
}
