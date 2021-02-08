import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';

class ExplorerBody extends StatelessWidget {
  final List<dynamic> places;

  ExplorerBody({this.places});

  Widget getInfo(context, place) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: primaryWhite,
            image: DecorationImage(
              image: NetworkImage(place.imageUrl),
              fit: BoxFit.fill,
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
