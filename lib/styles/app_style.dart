import 'package:flutter/material.dart';

mixin AppStyle {
  static final Color primaryColor = Color(0xffFD6585);
  static final Color primaryColorLight = Color(0xffFFD3A5);
  static const white = Colors.white;
  static const blackColor = Colors.black;

  static ThemeData get theme => _buildClinikkTheme();

  static ThemeData _buildClinikkTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      accentColor: primaryColorLight,
      primaryColor: primaryColor,
      cursorColor: primaryColor,
      textTheme: _buildTextTheme(base.textTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.white),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: white,
          bodyColor: white,
        );
  }
}
