import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SharedPreferences? sharedPreferences;
  SPHelper._();
  static SPHelper spHelper = SPHelper._();

  initSharePref() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }

  SetAuth(bool b) async {
    await initSharePref();
    await sharedPreferences?.setBool("islog", b);
  }

  Future<bool?> isAuth() async {
    await initSharePref();
    bool? a = sharedPreferences?.getBool("islog");
    return a;
  }

  sethivebase(bool h) async {
    await initSharePref();
    await sharedPreferences?.setBool("base", h);
  }

  Future<bool?> ishivebase() async {
    await initSharePref();
    bool? a = sharedPreferences?.getBool("base");
    return a;
  }
}
