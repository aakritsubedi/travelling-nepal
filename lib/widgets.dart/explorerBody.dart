import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/explorer.dart';
import 'package:travellingNepal/widgets.dart/placeInfo.dart';

class ExplorerBody extends StatelessWidget {
  final List<dynamic> places;

  ExplorerBody({this.places});

  Widget getInfo(context, place) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(children: [
        GestureDetector(
          onTap: () => openBottomSheet(context, place),
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: primaryWhite,
              image: DecorationImage(
                image: place.imageUrl.length != 0 ? NetworkImage(place.imageUrl) : AssetImage('assets/images/header-bg.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5.0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: primaryGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: primaryWhite),
                ),
                Text(
                  place.info,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w100,
                      color: primaryWhite),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  List<Row> getRow(context, places) {
    List<Row> widget = new List<Row>();
    for (int i = 0; i < places.length / 2; i++) {
      widget.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getInfo(context, places[i]),
        ],
      ));
    }

    return widget.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...getRow(context, places)],
    );
  }
}

void openBottomSheet(context, Explorer place) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
            color: Colors.transparent,
            child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    height: 300.0,
                    child: PlaceInfo(place: place))));
      });
}

