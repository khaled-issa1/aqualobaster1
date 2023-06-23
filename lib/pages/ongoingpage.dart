import 'package:aqualobster/appservices/SPHelper.dart';
import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/alarmsettingview.dart';
import 'package:aqualobster/pages/homepage.dart';
import 'package:aqualobster/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:workmanager/workmanager.dart';

class OnGoingPage extends StatelessWidget {
  static String routeName = 'OnGoingPage';
  const OnGoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 95,
            ),
            CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage('images/logo1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage('images/logo2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            const SizedBox(
              height: 100,
            ),
            Text(
              textAlign: TextAlign.center,
              ''' AquaCulture is a Water Quality Monitoring System that help lobster farmer to monitor major condition which affect on lobster healty live and production ''',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 12, 47, 73),
                ),
                child: TextButton(
                  onPressed: () async {
                    bool? hbase = await SPHelper.spHelper.ishivebase();
                    bool? ss = await SPHelper.spHelper.isAuth();
                    if (hbase != true) {
                      await AlarmSettingView.mybox.put('tmin', 30);
                      await AlarmSettingView.mybox.put('tmax', 40);
                      await AlarmSettingView.mybox.put('phmin', 1);
                      await AlarmSettingView.mybox.put('phmax', 7);
                      await AlarmSettingView.mybox.put('o2min', 70);
                      await AlarmSettingView.mybox.put('o2max', 100);
                      await SPHelper.spHelper.sethivebase(true);
                    } else {}
                    if (ss == true) {
                      await Workmanager().registerOneOffTask('aa', 'taskName1');

                      //AppNavigator.appNavigator.replace(HomePage.routeName);
                    } else {
                      await Workmanager().registerOneOffTask('aa', 'taskName1');
                      //AppNavigator.appNavigator.replace(LoginPage.routeName);
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
