import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/choiceListPage/choiceListPage.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() =>
    runApp(
        new MaterialApp(
            title: "find()",
            home: new FutureBuilder<GoogleSignInAccount>(
              future: _ifUserSignIn(),
              builder: (BuildContext context,
                  AsyncSnapshot<GoogleSignInAccount> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return new Text('Press button to start');
                  case ConnectionState.waiting:
                    return new Text('Awaiting result...');
                  default:
                    if (snapshot.hasError) {
                      return new Text('Error: ${snapshot.error}');
                    } else {
                      if (snapshot.data == null) {
                        return new SignIn();
                      } else {
                        return new ChoiceList();
                      }
                    }
                }
              },
            )
        ));

Future<GoogleSignInAccount> _ifUserSignIn() async {
  return new UserManager().ensureLoggedIn(false);

}