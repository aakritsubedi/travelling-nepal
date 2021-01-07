import 'package:flutter/material.dart';
import 'package:travellingNepal/app.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: App.getText(
            'What you would like to find?',
            primaryBlack,
            25.0,
            true,
            null,
            null,
            null));
  }
}
