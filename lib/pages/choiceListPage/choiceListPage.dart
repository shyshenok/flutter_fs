import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/moviesList.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';


class ChoiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Select list'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon (Icons.exit_to_app, color: Colors.white,),
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
        drawer: new Drawer(
            child: new ListView(
              children: <Widget> [
                new DrawerHeader(child: new Text('Header'),),
                new ListTile(
                  title: new Text('First Menu Item'),
                  onTap: () {},
                ),
                new ListTile(
                  title: new Text('Second Menu Item'),
                  onTap: () {},
                ),
                new Divider(),
                new ListTile(
                  title: new Text('About'),
                  onTap: () {},
                ),
              ],
            )
        ),
        body: new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/3.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: new Center(
            child: new Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new ButtonInList(new MoviesList())
              ],
            ),
          ),
        )
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