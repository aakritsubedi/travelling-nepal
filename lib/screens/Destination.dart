import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingNepal/app.dart';
import 'package:travellingNepal/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  bool isMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width - 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.destination.imageUrl),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back,
                            size: 30.0, color: primaryBlack),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    IconButton(
                        icon: Icon(Icons.pin_drop,
                            size: 30.0, color: primaryBlack),
                        onPressed: () {
                          setState(() {
                            isMap = true;
                          });
                        })
                  ],
                )
              ],
            ),
            Container(
              height: 300.0,
              child: SingleChildScrollView(
                child: isMap ? Text('Map'): CircularProgressIndicator(),
              )
            )
          ],
        ),
      ),
    );
  }

}
