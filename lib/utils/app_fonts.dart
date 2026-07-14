import 'package:flutter/material.dart';

/// Local font styles — no internet required.
class AppFonts {
  static TextStyle cinzel({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: 'Cinzel',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      shadows: shadows,
    );
  }

  static TextStyle cinzelDecorative({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: 'CinzelDecorative',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      shadows: shadows,
    );
  }

  static TextStyle medievalSharp({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: 'MedievalSharp',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      shadows: shadows,
    );
  }

  static TextStyle yatraOne({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontFamily: 'YatraOne',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      shadows: shadows,
    );
  }
}
