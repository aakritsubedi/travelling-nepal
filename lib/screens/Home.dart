import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/widgets.dart/dashboardSwitch.dart';
import 'package:travellingNepal/widgets.dart/nearMe.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.tagline}) : super(key: key);

  final String title;
  final String tagline;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTabIndex = 0;

  setTabIndex(index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        backgroundColor: primaryColor,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.location_pin, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setTabIndex(index);
        },
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            DashboardSwitch(index: selectedTabIndex)
          ],
        ),
      ),
    );
  }
}
