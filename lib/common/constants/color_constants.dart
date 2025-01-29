import 'package:flutter/material.dart';

class ColorConstants {
  static Color theWhite = Colors.white;
  static Color theRed = Colors.red;
  static Color theBlack = Colors.black87;
  static Color theBlue = Colors.blue;
  static Color theGrey = hexToColor('#808080');

  /// Marron
  static Color jazzberryJam = hexToColor('#A70855');

  /// Light Sky Blue BG
  static Color solitude = hexToColor('#ECF8FF');

  /// Grey
  static Color tundora = hexToColor('#444444');

  /// Light Grey BG
  static Color desertStorm = hexToColor('#E7E7E6');

  /// Grey BG
  static Color silver = hexToColor('#C2BFBF');

  /// Blue Black BG
  static Color pickledBluewood = hexToColor('#34495E');

  /// Green
  static Color salem = hexToColor('#109154');

  /// Lighter Marron BG
  static Color paleRose = hexToColor('#FFE7F2');

  /// Lightest Marron
  static Color wispPink = hexToColor('#FEF6FA');

  /// Yellow BG
  static Color fuelYellow = hexToColor('#E7B724');

  /// Light Grey
  static Color boulder = hexToColor('#787878');

  /// Lighter Grey
  static Color alto = hexToColor('#DADADA');

  /// Light Marron
  static Color brickRed = hexToColor('#CB3055');

  /// White
  static Color whitePointer = hexToColor('#FEF7FF');

  /// Red BG
  static Color sunsetOrange = hexToColor('#FF5252');

  /// White Shade
  static Color white70 = hexToColor('#FFFFFF').withOpacity(0.7);

  /// Amber
  static Color amber = hexToColor('#FFC107');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'Hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
