import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: App.getText(
            'What you would like to find?',
            secondaryColor,
            25.0,
            true,
            EdgeInsets.only(left: 20.0, top: 30.0, right: 60.0),
            null,
            null));
  }
}
