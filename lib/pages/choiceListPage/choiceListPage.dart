import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/moviesList.dart';
import 'package:flutter_fs/pages/drawer.dart';
import 'package:flutter_fs/utils/listOfLists.dart';


class ChoiceList extends StatefulWidget {


  @override
  _ChoiceListState createState() => new _ChoiceListState();
}

class _ChoiceListState extends State<ChoiceList> {

  ListOfLists currentItem;

  @override

  Widget build(BuildContext context) {
    List<Widget> menu = ifTapped() ?
    <Widget>[
      new Icon(Icons.done),
    ] :
    null;

    return new DefaultTabController(
        length: 3,
        child: new WillPopScope(
            onWillPop: onBackPress,
            child: new Scaffold(
              appBar: new AppBar(
                actions: menu,
                backgroundColor: new Color(0xFF228ba0),
                title: new Text('Select list'),
                bottom: new TabBar(
                  tabs: [
                    new Tab(text: 'Movies'),
                    new Tab(text: 'Places'),
                    new Tab(text: 'Books'),
                  ],
                ),
              ),
              drawer: createDrawer(context),
              body: new TabBarView(
                children: [
                  new MoviesList(onLongTap),
                  new Icon(Icons.directions_transit),
                  new Icon(Icons.directions_bike),
                ],
              ),
            ),
        )

    );
  }

  bool ifTapped() {
    return currentItem != null;
  }

  void onLongTap(ListOfLists item) {
    print(item);
    currentItem = item;

    setState(() {

    });
  }

  Future<bool> onBackPress() {

    final flag = ifTapped();

    currentItem = null;

    setState(() {

    });
    return new Future.value(!flag);
  }
}
