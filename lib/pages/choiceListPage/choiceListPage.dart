import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/addingFilmModalDialog.dart';
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
  final reference = FirebaseDatabase.instance.reference().child('list/movies');


  @override
  Widget build(BuildContext context) {
    List<Widget> menu = ifTapped() ?
    <Widget>[
      new IconButton(
        onPressed: () {
          _changeItem(currentItem.listName);
        },
        icon: new Icon(Icons.edit),
      ),
      new IconButton(
        onPressed: () {
          _deleteFromList();
        },
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
              backgroundColor: (ifTapped() ? new Color(0xFF076778) : new Color(
                  0xFF228ba0)),
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

  void _changeItem(String startText) async {
    await showDialog<String>(
        context: context,
        child: new TextModalDialog(startText, onSubmitChange, false, null)
    );
  }

  void onSubmitChange(String string) {

    currentItem.listName = string;

    reference.child(currentItem.key).set(currentItem.toJson());
  }

  void _deleteFromList() async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text('Confirm delete'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('Are you really want to delete this list?'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Delete'),
            onPressed: () {
              reference.child(currentItem.key).remove();
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}


