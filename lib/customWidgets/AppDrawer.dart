import 'package:aqualobster/customWidgets/DrawerMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style5,
      menuScreen: DrawerMenuScreen(),
      mainScreen: Container(
        height: 250,
        width: 288,
        color: const Color.fromARGB(255, 12, 47, 73),
        child: Stack(children: [
          Positioned(
            top: 70,
            left: 70,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                      image: AssetImage('images/logo2.png'))),
            ),
          ),
        ]),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: const Color(0xff0e3d7d),
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}
