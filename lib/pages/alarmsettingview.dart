import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AlarmSettingView extends StatefulWidget {
  static Box mybox = Hive.box('myalarmbox');

  const AlarmSettingView({Key? key}) : super(key: key);

  @override
  State<AlarmSettingView> createState() => _AlarmSettingViewState();
}

class _AlarmSettingViewState extends State<AlarmSettingView> {
  int pa = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 60,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0e3d7d),
                            )),
                            onPressed: () async {
                              pa = 1;
                              setState(() {});
                            },
                            child: Text('Current Range')),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff0e3d7d),
                            )),
                            onPressed: () async {
                              pa = 2;
                              setState(() {});
                            },
                            child: Text('New Range')),
                      ],
                    ),
                    pa == 1
                        ? Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Temperature Range',
                                    style: TextStyle(
                                        color: Color(0xff0e3d7d),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${AlarmSettingView.mybox.get('tmin')}-${AlarmSettingView.mybox.get('tmax')}',
                                    style: TextStyle(
                                        color: Color(0xff0e3d7d),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Acidity Range',
                                    style: TextStyle(
                                        color: Color(0xff0e3d7d),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 77,
                                  ),
                                  Text(
                                    '${AlarmSettingView.mybox.get('phmin')}-${AlarmSettingView.mybox.get('phmax')}',
                                    style: TextStyle(
                                        color: Color(0xff0e3d7d),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          )
                        : pa == 2
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'temp min',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        '${AlarmSettingView.mybox.get('tmin')}',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'tmin',
                                                (AlarmSettingView.mybox
                                                        .get('tmin') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'tmin',
                                                (AlarmSettingView.mybox
                                                        .get('tmin') +
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_upward)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'temp max',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        '${AlarmSettingView.mybox.get('tmax')}',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'tmax',
                                                (AlarmSettingView.mybox
                                                        .get('tmax') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'tmax',
                                                (AlarmSettingView.mybox
                                                        .get('tmax') +
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_upward)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'acidity min',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        '${AlarmSettingView.mybox.get('phmin')}',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'phmin',
                                                (AlarmSettingView.mybox
                                                        .get('phmin') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'phmin',
                                                (AlarmSettingView.mybox
                                                        .get('phmin') +
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_upward)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'acidity max',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        '${AlarmSettingView.mybox.get('phmax')}',
                                        style: TextStyle(
                                          color: Color(0xff0e3d7d),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'phmax',
                                                (AlarmSettingView.mybox
                                                        .get('phmax') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'phmax',
                                                (AlarmSettingView.mybox
                                                        .get('phmax') +
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_upward)),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
