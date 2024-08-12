import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color From Hex #FFFFFF to Flutter 0xFFFFFFFF
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// [hexColor] #ffffff
    // * Delete #
    String color = hexColor.replaceAll('#', '');
    // color = FFFFFF;
    String opacityColor = '$opacity$color'; // FFFFFFFF

    return Color(int.parse(opacityColor, radix: 16));
    // 0xFFFFFFFF
  }

  // * color App
  static final Color dark = colorFromHex('#1F1D2B');
  static final Color soft = colorFromHex('#252836');
  static final Color blueAccent = colorFromHex('#12CDD9');
  static final Color green = colorFromHex('#22B07D');
  static final Color orange = colorFromHex('#FF8700');
  static final Color red = colorFromHex('#FF7256');
  static final Color black = colorFromHex('#171725');
  static final Color darkGrey = colorFromHex('#696974');
  static final Color grey = colorFromHex('#92929D');
  static final Color whiteGrey = colorFromHex('#F1F1F5');
  static final Color white = colorFromHex('#FFFFFF');
  static final Color lineDark = colorFromHex('#EAEAEA');
}

//  static Color red = Colors.red;
//   static Color red1 = Color.fromARGB(255, 255, 42, 0);
//   static Color red2 = Color.fromRGBO(250, 0, 0, 0.5);

//   // 0 - 9 A - F (hex) 16
//   // #FF8877
//   // FF -> RED
//   // 88 -> Green
//   // 77 -> Blue
//   // # -> 0x
//   // FF opacity
//   // FF8877 | FF -> F | 88 -> 8 | 77 -> 7 (F87)
//   // 0xFFFF8877
//   // #F34783 -> f3 47 83

//   // FF54CB ->
//   // #F54cb

//   static Color red3 = Color(0xFFF87);
