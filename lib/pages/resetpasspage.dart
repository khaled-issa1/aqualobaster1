import 'package:aqualobster/appservices/SPHelper.dart';
import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/backend/backendhelper.dart';
import 'package:aqualobster/pages/homepage.dart';
import 'package:aqualobster/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ResetPassPage extends StatefulWidget {
  static String routeName = 'ResetPassPage';

  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  GlobalKey<FormState> formkey1 = GlobalKey();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 47, 73),
      ),
      body: Form(
          key: formkey1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Enter your Email ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 12, 47, 73),
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      onSaved: (v) {
                        email = v;
                      },
                      validator: (value) {
                        String v = value != null ? value : '';
                        if (v.isEmpty) {
                          return 'Enter your email address';
                        } else if (!isEmail(v)) {
                          return 'please enter correct email address';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 12, 47, 73),
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: const Color.fromARGB(255, 12, 47, 73), width: 3),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (formkey1.currentState!.validate()) {
                        formkey1.currentState!.save();
                        String? x =
                            await BackendHelper.backendHelper.passreset(email!);

                        if (x == null) {
                          Navigator.pop(context);
                        }
                        if (x != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(x),
                            duration: const Duration(seconds: 30),
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 47, 73),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
