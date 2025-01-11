import 'package:flutter/material.dart';

class ColorConstants {
  static Color textWhite = Colors.white;
  static Color textRed = Colors.red;
  static Color textBlack = Colors.black87;
  static Color textBlue = Colors.blue;
  static Color textGrey = hexToColor('#808080');

  /// Marron Color
  static Color color1 = hexToColor('#A70855');

  /// Light Sky Blue BG
  static Color color2 = hexToColor('#ECF8FF');

  /// Grey
  static Color color3 = hexToColor('#444444');

  /// Light Grey BG
  static Color color4 = hexToColor('#e7e7e6');

  /// Grey BG
  static Color color5 = hexToColor('#C2BFBF');

  /// Blue Black BG
  static Color color6 = hexToColor('#34495E');

  /// Green
  static Color color7 = hexToColor('#109154');

  /// Lighter Marron BG
  static Color color8 = hexToColor('#FFE7F2');

  /// Lightest Marron
  static Color color9 = hexToColor('#FEF6FA');

  /// Yellow BG
  static Color color10 = hexToColor('#E7B724');

  /// Light Grey
  static Color color11 = hexToColor('#787878');

  /// Lighter Grey
  static Color color12 = hexToColor('#DADADA');

  /// Light Marron
  static Color color13 = hexToColor('#CB3055');

  /// White
  static Color color14 = hexToColor('#FEF7FF');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'Hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
