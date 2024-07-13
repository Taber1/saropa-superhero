import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFFfacc15);
  static const primaryColorLight = Color(0xFFFFEB9B);
  static const primaryColorDark = Color(0xFFFFCC00);

  static const blueGrey = Colors.blueGrey;
  static const blackColor = Colors.black;
  static const transparentColor = Colors.transparent;
  static const whiteColor = Colors.white;
  static const redColor = Colors.red;
  static const purpleColor = Colors.purple;
  static const greyColorLight = Color(0xFFD8D8D8);
  static const greyColor = Color(0xFF646464);
  static const greyColorDark = Color(0xFF3D3D3D);

  static const Map<int, Color> themeColor = {
    50: Color.fromRGBO(250, 204, 21, .1),
    100: Color.fromRGBO(250, 204, 21, .2),
    200: Color.fromRGBO(250, 204, 21, .3),
    300: Color.fromRGBO(250, 204, 21, .4),
    400: Color.fromRGBO(250, 204, 21, .5),
    500: Color.fromRGBO(250, 204, 21, .6),
    600: Color.fromRGBO(250, 204, 21, .7),
    700: Color.fromRGBO(250, 204, 21, .8),
    800: Color.fromRGBO(250, 204, 21, .9),
    900: Color.fromRGBO(250, 204, 21, 1),
  };
  static MaterialColor primarySwatch = MaterialColor(0xFF022642d, themeColor);
}
