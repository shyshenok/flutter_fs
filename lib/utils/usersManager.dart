
import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManager {
  static final UserManager _singleton = new UserManager._internal();
  final analytics = new FirebaseAnalytics();
  final auth = FirebaseAuth.instance;

  factory UserManager() {
    return _singleton;
  }

  UserManager._internal();

  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<GoogleSignInAccount> ensureLoggedIn(bool forceLogin) async {
    print("111");

    final userManager = new UserManager();

    GoogleSignInAccount user = userManager.googleSignIn.currentUser;
    if (user == null)
      user = await userManager.googleSignIn.signInSilently();
    print(forceLogin);

    print("222");

    if (user == null && forceLogin)
      user = await userManager.googleSignIn.signIn();
      analytics.logLogin();

    if (await auth.currentUser() == null) {
      GoogleSignInAuthentication credentials =
      await googleSignIn.currentUser.authentication;
      await auth.signInWithGoogle(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
      );

    }

    return user;
  }

}