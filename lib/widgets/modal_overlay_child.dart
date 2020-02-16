import 'package:flutter/material.dart';

enum ModalType { success, error }

class ModalOverlayChild extends StatelessWidget {
  const ModalOverlayChild({
    @required this.context,
    @required this.content,
    this.title,
    this.modalType,
    Key key,
  }) : super(key: key);

  final BuildContext context;
  final String content;
  final String title;
  final ModalType modalType;

  @override
  Widget build(BuildContext context) => _successOverlayChild;

  Widget get _successOverlayChild {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: ShapeDecoration(
              color: modalType != null && modalType == ModalType.error
                  ? Colors.red
                  : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            child: Center(
              child: Text(
                title != null && title.isNotEmpty ? title : 'Success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
