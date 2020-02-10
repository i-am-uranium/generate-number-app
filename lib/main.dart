import 'package:flutter/cupertino.dart';
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
      debugShowCheckedModeBanner: false,
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

  final Map<String, List<dynamic>> decorationColorAndStops = {
    'colors': [
      AppStyle.primaryColor,
      AppStyle.primaryColorLight,
      AppStyle.primaryColor
    ],
    'stops': [0.0, 0.50, 0.80],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                SimpleDialog(
                  children: <Widget>[
                    Text(
                      'Any number will be called a happy number if, after repeatedly replacing it with a number equal to the sum of the square of all of its digits, leads us to number ‘1’. All other (not-happy) numbers will never reach ‘1’. Instead, they will be stuck in a cycle of numbers which does not include ‘1’.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                );
                print('info print');
              })
        ],
        title: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('CocoaQuartz',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: getContainerDecoration(
          colors: decorationColorAndStops['colors'].cast<Color>(),
          stops: decorationColorAndStops['stops'].cast<double>(),
        ),
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
