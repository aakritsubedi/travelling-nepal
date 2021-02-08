import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/services/lisfOfPlaces.dart';
import 'package:travellingNepal/widgets.dart/explorerBody.dart';
import 'package:travellingNepal/widgets.dart/explorerNavBar.dart';

class Explorer extends StatefulWidget {
  @override
  _ExplorerState createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  List<dynamic> places = [];
  List<String> navbarItems = [
    'Most Visited',
    'Hidden Gems',
    'Kid Friendly',
    'Art and Culture',
    'Outdoor',
    'History',
    'Museusms'
  ];

  @override
  void initState() {
    _getPlaces();
    super.initState();
  }

  _getPlaces() async {
    List allPlaces = await ExplorerServices.fetchAllPlaces();

    setState(() {
      places = allPlaces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10.0),
      AppBar(
          backgroundColor: primaryWhite,
          title: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefix: Icon(Icons.search)),
            ),
          )),
      SizedBox(height: 10.0),
      ExplorerNavBar(
        menuItems: navbarItems,
      ),
      ExplorerBody(
        places: places,
      ),
    ]);
  }
}
