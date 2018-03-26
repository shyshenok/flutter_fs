import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/moviesList.dart';
import 'package:flutter_fs/pages/drawer.dart';
import 'package:flutter_fs/pages/signIn/signIn.dart';
import 'package:flutter_fs/utils/usersManager.dart';





class ChoiceList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('Select list'),
              bottom: new TabBar(
                tabs: [
                  new Tab(text:'Movies'),
                  new Tab(text:'Places'),
                  new Tab(text:'Books'),
                ],
              ),
            ),
            drawer: createDrawer(context),
            body: new TabBarView(
              children: [
                new MoviesList(),
                new Icon(Icons.directions_transit),
                new Icon(Icons.directions_bike),
              ],
            ),
          ),
    );
  }
}
