import 'package:pingolearn/Constants/imports.dart';

class DoubleTapBackToClose extends StatefulWidget {
  final Widget child;

  const DoubleTapBackToClose({super.key, required this.child});

  @override
  _DoubleTapBackToCloseState createState() => _DoubleTapBackToCloseState();
}

class _DoubleTapBackToCloseState extends State<DoubleTapBackToClose> {
  DateTime? lastPressed;

  final snackBar = SnackBar(
    elevation: 6.0,
    margin: EdgeInsets.symmetric(vertical:10.h,horizontal: 90.w),
    backgroundColor: Colors.black54,
    behavior: SnackBarBehavior.floating,
    content: const Text(
      "Tap again to exit",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return false;
        } else {
          return true;
        }
      },
      child: widget.child,
    );
  }
}
