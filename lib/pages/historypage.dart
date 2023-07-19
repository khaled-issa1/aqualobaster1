import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryPage extends StatelessWidget {
  DatabaseReference databash = FirebaseDatabase.instance.ref();

  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databash.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                CarouselSlider(
                    items: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        child: LineChart(LineChartData(
                            titlesData: FlTitlesData(
                              topTitles:
                                  AxisTitles(axisNameWidget: Text('time')),
                              rightTitles: AxisTitles(
                                  axisNameWidget: Text('temperature')),
                            ),
                            minX: 1,
                            minY: 15,
                            maxX: 12,
                            maxY: 45,
                            lineBarsData: [
                              LineChartBarData(spots: [
                                FlSpot(
                                    1,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_0/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    2,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_1/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    3,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_2/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    4,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_3/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    5,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_4/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    6,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_5/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    7,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_6/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    8,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_7/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    9,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_8/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    10,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_9/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    11,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_10/temperature')
                                        .value
                                        .toString())),
                                FlSpot(
                                    12,
                                    double.parse(snapshot.data!.snapshot
                                        .child(
                                            'sensors/history/hour_11/temperature')
                                        .value
                                        .toString())),
                              ]),
                            ])),
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        child: LineChart(LineChartData(
                            titlesData: FlTitlesData(
                              topTitles:
                                  AxisTitles(axisNameWidget: Text('time')),
                              rightTitles:
                                  AxisTitles(axisNameWidget: Text('Acidity')),
                            ),
                            minX: 1,
                            minY: 0,
                            maxX: 12,
                            maxY: 12,
                            lineBarsData: [
                              LineChartBarData(spots: [
                                FlSpot(
                                    1,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_0/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    2,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_1/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    3,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_2/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    4,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_3/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    5,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_4/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    6,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_5/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    7,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_6/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    8,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_7/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    9,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_8/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    10,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_9/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    11,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_10/ph')
                                        .value
                                        .toString())),
                                FlSpot(
                                    12,
                                    double.parse(snapshot.data!.snapshot
                                        .child('sensors/history/hour_11/ph')
                                        .value
                                        .toString())),
                              ]),
                            ])),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(
                  height: 30,
                ),
                TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: const Color.fromARGB(255, 12, 47, 73),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Temreature',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: const Color.fromARGB(255, 12, 47, 73),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Acidity',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              'Time',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 12, 47, 73),
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_0/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_0/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '1 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_1/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_1/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '2 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_2/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_2/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '3 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_3/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_3/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '4 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_4/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_4/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '5 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_5/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_5/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '6 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_6/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_6/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '7 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_7/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_7/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '8 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_8/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_8/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '9 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_9/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_9/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '10 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_10/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_10/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '11 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.center,
                    endChild: Card(
                      color: Color.fromARGB(255, 39, 173, 95),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_11/temperature')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    startChild: Card(
                      color: Color.fromARGB(255, 167, 95, 177),
                      child: Container(
                        height: 45,
                        child: Center(
                          child: Text(
                            snapshot.data!.snapshot
                                .child('sensors/history/hour_11/ph')
                                .value
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    indicatorStyle: IndicatorStyle(
                        width: 60,
                        height: 60,
                        indicator: Container(
                          child: Center(
                            child: Text(
                              '12 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ))),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          }
        });
  }
}
