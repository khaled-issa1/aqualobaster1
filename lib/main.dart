import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/alarmsettingview.dart';
import 'package:aqualobster/pages/homepage.dart';
import 'package:aqualobster/pages/loginpage.dart';
import 'package:aqualobster/pages/mainview.dart';
import 'package:aqualobster/pages/ongoingpage.dart';
import 'package:aqualobster/pages/registerpage.dart';
import 'package:aqualobster/pages/resetpasspage.dart';
import 'package:aqualobster/pages/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'firebase_options.dart';
import 'package:workmanager/workmanager.dart';
import 'package:firebase_database/firebase_database.dart';

void callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    DataSnapshot aaa = await FirebaseDatabase.instance.ref().get();

    int tvalue = int.parse(aaa.child('sensors/temperature').value!.toString());
    double phvalue = double.parse(aaa.child('sensors/ph').value!.toString());

    print('${aaa.child('sensors/temperature').value.toString()}');
    print('background task work correctly');

    if (tvalue > AlarmSettingView.mybox.get('tmax') ||
        tvalue < AlarmSettingView.mybox.get('tmin') ||
        tvalue > AlarmSettingView.mybox.get('phmax') ||
        tvalue < AlarmSettingView.mybox.get('phmin')) {
      print('sensor value is out of ranges!');
    } else {
      print('all sensor value is in normal range');
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory1 = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory1.path);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  await Workmanager().registerPeriodicTask('taskone', 'AlarmNotification');

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
        ResetPassPage.routeName: (context) => ResetPassPage(),
      },
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Color.fromARGB(255, 12, 47, 73), fontSize: 18))),
      home: const SplashPage(),
    );
  }
}
