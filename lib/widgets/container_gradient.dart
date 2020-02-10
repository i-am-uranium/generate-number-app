import 'package:flutter/material.dart';

BoxDecoration getContainerDecoration(
    {@required List<Color> colors, @required List<double> stops}) {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: colors,
      stops: stops,
    ),
  );
}
