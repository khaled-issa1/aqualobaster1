import 'dart:io';
import 'package:aqualobster/customWidgets/AppDrawer.dart';
import 'package:aqualobster/pages/alarmsettingview.dart';
import 'package:aqualobster/pages/historypage.dart';
import 'package:aqualobster/pages/mainview.dart';
import 'package:aqualobster/pages/profileview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'HomePage';
  GlobalKey<ScaffoldState> gsk = GlobalKey<ScaffoldState>();
  PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gsk,
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 12, 47, 73),
        items: const [
          TabItem(icon: Icons.alarm, title: 'Alarm'),
          TabItem(icon: Icons.history, title: 'History'),
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app, title: 'Exit'),
        ],
        initialActiveIndex: 2,
        onTap: (i) {
          if (i == 0) {
            pageController.jumpToPage(0);
          } else if (i == 1) {
            pageController.jumpToPage(1);
          } else if (i == 2) {
            pageController.jumpToPage(2);
          } else if (i == 3) {
            pageController.jumpToPage(3);
          } else if (i == 4) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text(
                      " Are you sure you want to close app",
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 47, 73),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "No",
                          style: TextStyle(
                              color: Color.fromARGB(255, 12, 47, 73),
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
                              color: Color.fromARGB(255, 12, 47, 73),
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
          }
        },
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 47, 73),
        title: const Text('Aqua Lobaster'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        children: [
          AlarmSettingView(),
          HistoryPage(),
          MainView(),
          ProfileView(),
        ],
      ),
    );
  }
}
