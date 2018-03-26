import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';


const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

createDrawer (context) {
  return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: const Text(_AccountName),
            accountEmail: const Text(_AccountEmail),
            currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.brown,
                child: new Text(_AccountAbbr)
            ),
          ),

          new ListTile(
            leading: new Icon(Icons.lightbulb_outline),
            title: new Text('Second Menu Item'),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.lightbulb_outline),
            title: new Text('Second Menu Item'),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.exit_to_app),
            title: new Text('Sign Out'),
            onTap: () {
              new UserManager().googleSignIn.signOut();
              Navigator.of(context).push(
                new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new SignIn()
                ),
              );
            },
          ),
        ],
      )
  );
}