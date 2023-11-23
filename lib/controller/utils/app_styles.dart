import 'package:flutter/material.dart';


import 'app_strings.dart';

class AppStyles {
  static const TextStyle getStarted = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      fontFamily: CustomerEngagement.labelMuli,
      color: Color(0xff2C2C2C));

  static const TextStyle loginScreenSmallText =
      TextStyle(fontSize: 16, fontFamily: "Regular", color: Color(0xff6E6E6E));

  static const TextStyle customerDash = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: CustomerEngagement.labelMuli,
      color: Color(0xff2C2C2C));

  static TextStyle appBarStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: CustomerEngagement.labelMuli,
    color: Colors.grey.shade600,
  );

  static TextStyle startCustomerWidget = TextStyle(
    fontSize: 27,
    fontFamily: CustomerEngagement.labelMuli,
    fontWeight: FontWeight.w100,
    color: Colors.grey.shade900,
  );
}
