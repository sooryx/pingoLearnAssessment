import'package:pingolearn/Constants/imports.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(SharedPreferencesManager().isLoggedIn);
      SharedPreferencesManager().isLoggedIn
          ? Navigator.pushReplacementNamed(context, "/homescreen")
          : Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/signin');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(Imagepaths.Logo)),
    );
  }
}
