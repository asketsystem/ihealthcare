import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getPageTitleTextStyle(double fontSize) {
  return TextStyle(
      color: Color(0xFF2E3D5F),
      fontSize: fontSize,
      fontWeight: FontWeight.w600);
}

getWorldWideTextStyle(double fontSize) {
  return TextStyle(
      color: Color(0xFFA1ADC7),
      fontSize: fontSize,
      fontWeight: FontWeight.w600);
}

getWorldWideCountdownNumberStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300);
}

getDeathCountdownNumberStyle() {
  return TextStyle(
      color: Color(0xFFF73E3E), fontSize: 20, fontWeight: FontWeight.w300);
}

getConfirmedRecoveredTextStyle() {
  return TextStyle(color: Color(0xFFBEC0C6), fontWeight: FontWeight.w400);
}

getDeathTitleTextStyle() {
  return TextStyle(color: Color(0xFFF73E3E), fontWeight: FontWeight.w400);
}
