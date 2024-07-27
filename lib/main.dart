// lib/main.dart
import 'package:pingolearn/Constants/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final RemoteConfigService remoteConfigService = RemoteConfigService(
    remoteConfig: FirebaseRemoteConfig.instance,
  );
  SharedPreferencesManager().init();
  await remoteConfigService.initialize();
  runApp(
    MyApp(
      remoteConfigService: remoteConfigService,
    ),
  );
}

class MyApp extends StatefulWidget {
  final RemoteConfigService remoteConfigService;

  const MyApp({super.key, required this.remoteConfigService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: const Size(411.42857142857144, 843.4285714285714),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Homescreenprovider()),
            Provider<RemoteConfigService>.value(value: widget.remoteConfigService),

          ],

            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: customTheme,
              initialRoute: '/',
              onGenerateRoute: (settings) {
                if (settings.name == '/homescreen') {
                  return RouteGenerator.generateRoute(
                    RouteSettings(
                      name: settings.name,
                      arguments: widget.remoteConfigService,
                    ),
                  );
                }
                return RouteGenerator.generateRoute(settings);
              },
            ),
        );
      },
    );
  }
}
