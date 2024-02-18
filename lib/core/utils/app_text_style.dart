import 'package:flutter/material.dart';

class AppTextStyle {
  static const String _fontFamily = "ProtestRevolution";

  static TextStyle thin({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: color,
      );

  static TextStyle light({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w200,
        color: color,
      );

  static TextStyle ultralight({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
      );

  static TextStyle regular({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle medium({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: fontSize,
      );

  static TextStyle semiBold({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: fontSize,
      );

  static TextStyle bold({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle heavy({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      );

  static TextStyle black({Color? color, double? fontSize}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
      );
}
