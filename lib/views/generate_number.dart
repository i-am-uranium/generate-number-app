import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:numbers/api/numbers_api.dart';
import 'package:numbers/model/number_detail.dart';
import 'package:numbers/styles/app_style.dart';
import 'package:numbers/widgets/ghost_button.dart';
import 'package:random_color/random_color.dart';

class GenerateNumber extends StatefulWidget {
  const GenerateNumber({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GenerateNumberState createState() => _GenerateNumberState();
}

class _GenerateNumberState extends State<GenerateNumber> {
  String _happyNumber = '7';
  final NumberApi _api = NumberApi();
  final RandomColor _randomColor = RandomColor();

  void _generateHappyNumber() async {
    final NumberDetail numberDetail = await _api.getHappyNumber();
    setState(() => _happyNumber = '${numberDetail.number}');
  }

  Widget get _generateNumber {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .25,
      height: MediaQuery.of(context).size.height * .50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _happyNumber,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: randomColor,
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
    );
  }

  Color get randomColor {
    return _randomColor.randomColor(
      colorHue: ColorHue.purple,
      colorSaturation: ColorSaturation.mediumSaturation,
      colorBrightness: ColorBrightness.light,
    );
  }

  Widget get numberView {
    return MouseRegion(
      onHover: (event) {
        _api.getHappyNumber().then(
          (numberDetail) {
            BotToast.showAttachedWidget(
              attachedBuilder: (_) => Text(
                '${numberDetail.number != null ? numberDetail.number : _happyNumber}',
                style: TextStyle(
                  color: randomColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
              duration: Duration(milliseconds: 700),
              target: Offset(
                event.position.dx,
                event.position.dy,
              ),
            );
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .96,
        color: AppStyle.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(
              height: MediaQuery.of(context).size.height * .1,
            ),
            _generateNumber,
            Padding(
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Text('Made with ❤️ by Flutter'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMain() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .04,
            color: AppStyle.primaryColorLight,
            child: Padding(
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cocoa'),
                  Image.asset(
                    'GitHub-Mark-64px.png',
                  ),
                ],
              ),
            ),
          ),
          numberView,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: getMain(),
      ),
    );
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
