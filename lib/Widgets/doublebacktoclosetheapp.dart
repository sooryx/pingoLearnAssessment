import 'package:flutter/material.dart';

class DoubleTapBackToClose extends StatefulWidget {
  final Widget child;

  const DoubleTapBackToClose({super.key, required this.child});

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
        const maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
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
