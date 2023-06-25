import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  DatabaseReference database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: database.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/logo2.png')))),
                  const SizedBox(
                    height: 50,
                  ),
                  Card(
                    color: const Color.fromARGB(255, 12, 47, 73),
                    child: SizedBox(
                      width: 280,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Temperature:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                snapshot.data!.snapshot
                                    .child('sensors/temperature')
                                    .value
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const SizedBox(
                            width: 60,
                            height: 100,
                            child: Image(
                              image: AssetImage('images/ticon.png'),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    color: const Color.fromARGB(255, 12, 47, 73),
                    child: SizedBox(
                      width: 280,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Acidity:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                snapshot.data!.snapshot
                                    .child('sensors/ph')
                                    .value
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          const SizedBox(
                            width: 60,
                            height: 100,
                            child: Image(
                              image: AssetImage('images/ticon.png'),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          }
        });
  }
}
