import 'package:flutter/material.dart';

class CustomColor {
  static const menuBackgroundColor =  Color(0xff205e8d);
  // static final menuBackgroundColor = Color.fromARGB(255, 70, 195, 66);
  static final colors = {
    'main': const Color(0xffff5c00),
  };
  static MaterialColor get(String colorName) {
    int v = colors[colorName]!.value;
    return MaterialColor(
      v,
      <int, Color>{
        50: Color(v),
        100: Color(v),
        200: Color(v),
        300: Color(v),
        400: Color(v),
        500: Color(v),
        600: Color(v),
        700: Color(v),
        800: Color(v),
        900: Color(v),
      },
    );
  }
}
