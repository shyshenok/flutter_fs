import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/moviesList.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';


const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';


class ChoiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(
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
        ),
        body: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('Select list'),
              leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {},
              ),
              bottom: new TabBar(
                tabs: [
                  new Tab(text:'Movies'),
                  new Tab(text:'Places'),
                  new Tab(text:'Books'),
                ],
              ),
            ),
            body: new TabBarView(
              children: [
                new Icon(Icons.directions_car),
                new Icon(Icons.directions_transit),
                new Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
    );
  }
}

class ButtonInList extends StatelessWidget {

  final Widget newPage;

  ButtonInList(this.newPage);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton (
      onPressed: () {
        Navigator.of(context).push(
          new PageRouteBuilder(
              pageBuilder: (_, __, ___) => newPage
          ),
        );
      },
      child: new Text('List of films'),
    );
  }
}