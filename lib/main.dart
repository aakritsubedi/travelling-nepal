import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DataSource.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: DataSource.appName, tagline: DataSource.tagline),
    );
  }
}
