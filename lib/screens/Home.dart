import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.tagline}) : super(key: key);

  final String title;
  final String tagline;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            Text(widget.tagline, style: TextStyle(fontSize: 12.0),)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            Text(widget.tagline)
          ],
        ),
      ),
    );
  }
}
