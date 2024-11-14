import 'package:flutter/material.dart';

class ColorConstants {
  static Color textWhite = Colors.white;
  static Color color1 = hexToColor('#A70855');
  static Color color2 = hexToColor('#ECF8FF');
  static Color color3 = hexToColor('#444444');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'Hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
