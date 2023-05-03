import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/homepage.dart';
import 'package:aqualobster/pages/loginpage.dart';
import 'package:aqualobster/pages/ongoingpage.dart';
import 'package:aqualobster/pages/registerpage.dart';
import 'package:aqualobster/pages/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory1 = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory1.path);

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            MyApp(),
          ));

  await Hive.openBox('myalarmbox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.appNavigator.nsk,
      debugShowCheckedModeBanner: false,
      routes: {
        OnGoingPage.routeName: (context) => OnGoingPage(),
        HomePage.routeName: (context) => HomePage(),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
      },
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Color.fromARGB(255, 12, 47, 73), fontSize: 18))),
      home: const SplashPage(),
    );
  }
}
