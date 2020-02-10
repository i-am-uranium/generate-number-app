import 'package:flutter/material.dart';
import 'package:numbers/styles/app_style.dart';

FlatButton getGhostButton({String title, Function onPressed}) {
  return FlatButton(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
        color: AppStyle.white,
      ),
    ),
    child: Text(
      '$title',
    ),
    onPressed: onPressed,
  );
}
