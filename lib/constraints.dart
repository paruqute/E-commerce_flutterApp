import 'dart:math';

import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF308614);
const TextColor = Color(0xFF3C4046);
const backgroundColor = Color(0xFFF9F8FD);
const Color darkGrey = Color(0xff202020);
const double DefaultPadding = 20.0;

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];
getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

class SizeConfig {
  static double widthInPx = 1080;
  static double heightInPx = 1920;
  static double defaultSize = 21;
  static MediaQueryData _mediaQueryData;
  static double pixelRatio;
  static double screenWidth;
  static double screenHeight;
  static double defaultHeight;
  static double defaultWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pixelRatio = _mediaQueryData.devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    defaultHeight = defaultSize * screenHeight / heightInPx;
    defaultWidth = defaultSize * screenWidth / widthInPx;
  }
}
