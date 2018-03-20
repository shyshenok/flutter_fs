import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/pages/style/gradientAppBar.dart';
import 'package:flutter_fs/utils/usersManager.dart';


class ChoiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("HEYO!");

    return new Scaffold(
      body: new Column(
          children: [
            new GradientAppBar('Choise list'),
            new Text('HelloList'),
            new IconButton(
              icon: new Icon (Icons.exit_to_app, color: Colors.red,) ,
              onPressed: () {
                new UserManager().googleSignIn.signOut();
                Navigator.of(context).push(
                  new PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new SignIn()
                  ),
                );
              }
            )
          ],
        )
    );
  }
}

