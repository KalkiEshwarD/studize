import 'package:flutter/material.dart';

const double signInTextBoxSize = 350;

double screenWidth(context) => (0.95) * MediaQuery.of(context).size.width;
double screenHeight(context) => MediaQuery.of(context).size.height;

class PaddingDist {
  static const double drawerDistance = 25;
}

class DefaultSettings {
  // Duration mentioned in hours
  static var defaultDuration = 1;

  static void changeSettings(int durationHours) {
    defaultDuration = durationHours;
  }
}

class StaticConstants {
  static final monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static const double tableRowSpacing = 20;
}
