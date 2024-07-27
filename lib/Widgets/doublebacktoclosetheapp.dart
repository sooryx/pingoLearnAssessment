import 'package:flutter/material.dart';

class DoubleTapBackToClose extends StatefulWidget {
  final Widget child;

  const DoubleTapBackToClose({Key? key, required this.child}) : super(key: key);

  @override
  _DoubleTapBackToCloseState createState() => _DoubleTapBackToCloseState();
}

class _DoubleTapBackToCloseState extends State<DoubleTapBackToClose> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back again to exit'),
              duration: maxDuration,
            ),
          );
          return false;
        } else {
          return true;
        }
      },
      child: widget.child,
    );
  }
}
