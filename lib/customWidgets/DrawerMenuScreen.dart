import 'dart:io';
import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 300,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffd9d9d9),
            ),
            width: 200,
            child: TextButton(
                onPressed: () {
                  AppNavigator.appNavigator.replace(HomePage.routeName);
                },
                child: const Text(
                  'Home Page',
                  style: TextStyle(color: Color(0xff0e3d7d), fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffd9d9d9),
            ),
            width: 200,
            child: TextButton(
                onPressed: () {
                  // AppNavigator.appNavigator.replace(AboutApp.routeName);
                },
                child: const Text(
                  'About App',
                  style: TextStyle(color: Color(0xff0e3d7d), fontSize: 20),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffd9d9d9),
              ),
              width: 200,
              child: TextButton(
                  onPressed: () {
                    // AppNavigator.appNavigator.replace(ContactUs.routeName);
                  },
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Color(0xff0e3d7d), fontSize: 20),
                  ))),
          const SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffd9d9d9),
              ),
              width: 200,
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text(
                              " Are you sure you want to close app",
                              style: TextStyle(
                                  color: Color(0xff0e3d7d),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                      color: Color(0xff0e3d7d),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "yes",
                                  style: TextStyle(
                                      color: Color(0xff0e3d7d),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (Platform.isAndroid) {
                                    SystemNavigator.pop();
                                  } else if (Platform.isIOS) {
                                    exit(0);
                                  }
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Exit',
                    style: TextStyle(color: Color(0xff0e3d7d), fontSize: 20),
                  ))),
        ],
      ),
    );
  }
}
