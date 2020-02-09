import 'package:flutter/material.dart';
import 'package:numbers/styles/app_style.dart';

BoxDecoration get containerDecoration {
  final stops = [0.0, 0.50, 0.80];
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      stops: stops,
      colors: [
        AppStyle.primaryColor,
        AppStyle.primaryColorLight,
        AppStyle.primaryColor,
      ],
    ),
  );
}
