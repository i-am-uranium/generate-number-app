import 'package:flutter/material.dart';

class HUDOverlay extends StatefulWidget {
  const HUDOverlay({@required this.child, Key key, this.color})
      : super(key: key);
  final Widget child;
  final Color color;

  @override
  _HUDOverlayState createState() => _HUDOverlayState();
}

class _HUDOverlayState extends State<HUDOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimatoin;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimatoin =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller
      ..addListener(() => setState(() {}))
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: ScaleTransition(
          scale: scaleAnimatoin,
          child: widget.child,
        ),
      ),
    );
  }
}
