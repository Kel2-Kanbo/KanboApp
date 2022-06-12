import 'package:flutter/material.dart';

class AppColors {
  final Map<int, Color> _primary = const {
    50: Color.fromRGBO(76, 53, 224, 0.1),
    100: Color.fromRGBO(76, 53, 224, 0.2),
    200: Color.fromRGBO(76, 53, 224, 0.3),
    300: Color.fromRGBO(76, 53, 224, 0.4),
    400: Color.fromRGBO(76, 53, 224, 0.5),
    500: Color.fromRGBO(76, 53, 224, 0.6),
    600: Color.fromRGBO(76, 53, 224, 0.7),
    700: Color.fromRGBO(76, 53, 224, 0.8),
    800: Color.fromRGBO(76, 53, 224, 0.9),
    900: Color.fromRGBO(76, 53, 224, 1.0),
  };

  MaterialColor get colorPrimary => MaterialColor(0xff4C35E0, _primary);
  Color get textBoldColor => HexColor('#1F1F1F');
  Color get textColor => HexColor('#5C5C5C');
  Color get grey2 => HexColor('#888686');
  Color get grey3 => HexColor('#D7D7D7');
  Color get white2 => HexColor('#F4F4F4');
  Color get yellow => HexColor('#FFEC42');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    return int.parse(hexColor, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}
