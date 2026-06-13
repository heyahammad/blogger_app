import 'package:blogger/core/theme/color_pallate.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border([
    Color borderColor = ColorPallate.borderColor,
  ]) => OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 3),
    borderRadius: BorderRadius.circular(15),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallate.backgroundColor,

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(ColorPallate.gradient2),
    ),
  );
}
