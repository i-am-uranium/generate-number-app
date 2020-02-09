import 'package:flutter/material.dart';
import 'package:numbers/model/number_detail.dart';
import 'package:numbers/styles/app_style.dart';
import 'package:numbers/widgets/container_gradient.dart';
import 'package:numbers/widgets/ghost_button.dart';

import 'api/numbers_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers',
      theme: AppStyle.theme,
      home: MyHomePage(title: 'Generates a number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _happyNumber = '7';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: containerDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'solar-system.png',
              alignment: Alignment.center,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              _happyNumber,
              style: TextStyle(
                fontSize: 48,
                color: AppStyle.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            getGhostButton(
              onPressed: _generateHappyNumber,
              title: 'Generate a happy number',
            ),
          ],
        ),
      ),
    );
  }

  void _generateHappyNumber() async {
    final NumberApi api = NumberApi();
    final NumberDetail numberDetail = await api.getHappyNumber();
    setState(() => _happyNumber = '${numberDetail.number}');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
