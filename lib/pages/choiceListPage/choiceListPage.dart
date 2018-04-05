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

  MoviesList moviesList;

  @override
  Widget build(BuildContext context) {

    List<Widget> menu = ifTapped() ?
    <Widget>[
      new IconButton(
        onPressed: (){},
        icon: new Icon(Icons.edit),
      ),
      new IconButton(
        onPressed: (){},
        icon: new Icon(Icons.delete),
      ),
    ] :
    null;

    moviesList = new MoviesList(onLongTap, onBackPress, isSelected);

    return new DefaultTabController(
        length: 3,
        child: new WillPopScope(
            onWillPop: onBackPress,
            child: new Scaffold(
              appBar: new AppBar(
                leading: ifTapped() ? new IconButton(
                     icon: new Icon(Icons.arrow_back),
                     onPressed: onBackPress)
                    : null,
                actions: menu,
                backgroundColor:(ifTapped() ? new Color(0xFF076778) : new Color(0xFF228ba0)),
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
                  moviesList,
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
    currentItem = item;
    setState(() {

    });
  }

  Future<bool> onBackPress() {

    final flag = ifTapped();

    currentItem = null;

    setState(() {});

    return new Future.value(!flag);
  }

  bool isSelected(ListOfLists item) {

    return currentItem != null && currentItem == item;
  }
}


