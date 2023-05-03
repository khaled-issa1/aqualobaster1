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
                            onPressed: () async {
                              pa = 1;
                              setState(() {});
                            },
                            child: Text('Current Range')),
                        ElevatedButton(
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
                                height: 40,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const Text('Temperature Range'),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                      '${AlarmSettingView.mybox.get('tmin')}-${AlarmSettingView.mybox.get('tmax')}')
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const Text('Oxygen Range'),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                      '${AlarmSettingView.mybox.get('o2min')}-${AlarmSettingView.mybox.get('o2max')}')
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const Text('Acidity Range'),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                      '${AlarmSettingView.mybox.get('phmin')}-${AlarmSettingView.mybox.get('phmax')}')
                                ],
                              )
                            ],
                          )
                        : pa == 2
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('temp min'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('tmin')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
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
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('temp max'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('tmax')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
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
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('acidity min'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('phmin')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
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
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('acidity max'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('phmax')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
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
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('oxygen min'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('o2min')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'o2min',
                                                (AlarmSettingView.mybox
                                                        .get('o2min') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'o2min',
                                                (AlarmSettingView.mybox
                                                        .get('o2min') +
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_upward)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('oxygen max'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${AlarmSettingView.mybox.get('o2max')}'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'o2max',
                                                (AlarmSettingView.mybox
                                                        .get('o2max') -
                                                    1));

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.arrow_downward)),
                                      IconButton(
                                          onPressed: () {
                                            AlarmSettingView.mybox.put(
                                                'o2max',
                                                (AlarmSettingView.mybox
                                                        .get('o2max') +
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
