import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:numbers/styles/app_style.dart';
import 'package:numbers/views/generate_number.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'Numbers',
        debugShowCheckedModeBanner: false,
        theme: AppStyle.theme,
        home: GenerateNumber(title: 'Generates a number'),
        navigatorObservers: [
          BotToastNavigatorObserver()
        ], //2.registered route observer
      ),
    );
  }
}
