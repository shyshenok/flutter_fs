import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';


class ChoiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("HEYO!");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Fancy Dress'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new IconButton(
              icon: new Icon (Icons.exit_to_app, color: Colors.white,) ,
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
      ),
      body: new Column(
          children: [
            new Text('HelloList'),
          ],
        )
    );
  }
}

