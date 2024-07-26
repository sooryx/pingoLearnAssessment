// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/Constants/customroutes.dart';
import 'package:pingolearn/Constants/customthemes.dart';
import 'package:pingolearn/Providers/homescreenprovider.dart';
import 'package:pingolearn/Screens/Auth/signinscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn/Services/AuthServices/authservices.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(
    MultiProvider(
      providers: [
        Provider<Homescreenprovider>(create: (_) => Homescreenprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42857142857144, 843.4285714285714),
      builder: (context, child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: customTheme,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
