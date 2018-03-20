
import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';


class UserManager {
  static final UserManager _singleton = new UserManager._internal();

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

    print(forceLogin);

    return user;
  }

}