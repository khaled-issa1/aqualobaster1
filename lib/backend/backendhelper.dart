import 'package:aqualobster/appservices/SPHelper.dart';
import 'package:aqualobster/appservices/appnavigator.dart';
import 'package:aqualobster/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackendHelper {
  BackendHelper._();
  static BackendHelper backendHelper = BackendHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> passreset(String ss) async {
    try {
      await auth.sendPasswordResetEmail(email: ss);
      return null;
    } catch (e) {
      return '$e';
    }
  }

  Future<String?> signup(String em, String pas) async {
    try {
      await auth.createUserWithEmailAndPassword(email: em, password: pas);
      AppNavigator.appNavigator.replace(LoginPage.routeName);
      return null;
    } catch (e) {
      return '$e';
    }
  }

  login(String em, String pas) async {
    try {
      await auth.signInWithEmailAndPassword(email: em, password: pas);
      SPHelper.spHelper.SetAuth(true);
      return null;
    } catch (e) {
      return '$e';
    }
  }

  logout() async {
    try {
      await auth.signOut();
      SPHelper.spHelper.SetAuth(false);
      AppNavigator.appNavigator.replace(LoginPage.routeName);
      return null;
    } catch (e) {
      return '$e';
    }
  }

  userData() {
    String? e = auth.currentUser?.email;
    String? u = auth.currentUser?.uid;

    return [e, u];
  }
}
