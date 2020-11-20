import 'package:flutter/material.dart';
import 'package:travellingNepal/widgets.dart/dashboardSwitch.dart';
import 'package:travellingNepal/widgets.dart/homeBanner.dart';
import 'package:travellingNepal/widgets.dart/tabMenu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.tagline}) : super(key: key);

  final String title;
  final String tagline;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedTabIndex = -1;

  setTabIndex(index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 0.0
          ),
          children: <Widget>[
            HomeBanner(),
            SizedBox(height: 10.0),
            TabMenu(index: selectedTabIndex, setIndex: setTabIndex),
            DashboardSwitch(index: selectedTabIndex)
          ],
        ),
      ),
    );
  }
}
