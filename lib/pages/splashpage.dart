import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/ongoingpage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  automaticmovepage() async {
    await Future.delayed(const Duration(seconds: 4));
    AppNavigator.appNavigator.replace(OnGoingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    automaticmovepage();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/logo2.png')),
        ),
      ),
    );
  }
}
