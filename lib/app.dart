import 'package:flutter/material.dart';

Color primaryColor = Color(0xFFD21FC3);
Color secondaryColor = Color(0xFF02075D);
Color primaryWhite = Color(0xFFFFFFFF);
double horizontalPadding = 10.0;
double verticalPadding = 10.0;

class App {
  static String appName = 'Travelling Nepal';
  static String tagline = 'once is not enough';

  static Container getText(text, color, fontSize, isBold, padding, margin, letterSpacing) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          letterSpacing: letterSpacing
        ),
      ),
    );
  }
}
