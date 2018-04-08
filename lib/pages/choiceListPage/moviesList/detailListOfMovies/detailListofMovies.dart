import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fs/utils/listOfLists.dart';
import 'package:meta/meta.dart';
import 'package:material_search/material_search.dart';


class DetailListOfMovies extends StatefulWidget {

  final ListOfLists data;

  DetailListOfMovies({Key key, @required this.data}) : super(key: key);

  _DetailListOfMoviesState createState() => new _DetailListOfMoviesState(data);
}

class _DetailListOfMoviesState extends State<DetailListOfMovies> {
  final ListOfLists data;

  _DetailListOfMoviesState(this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xFF228ba0),
        title: new Text("${data.listName}"),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Stack(
          children: <Widget>[
            new Positioned (
              right: 16.0,
              bottom: 16.0,
              child: new Container(
                child: new FloatingActionButton(
                    elevation: 6.0,
                    child: new Icon(Icons.add),
                    backgroundColor: new Color(0xFF228ba0),
                    onPressed: () {
                      _openAddEntryDialog();
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openAddEntryDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new AddEntryDialog();
        },
        fullscreenDialog: true
    ));
  }


}

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {

  TextEditingController _movieName = new TextEditingController();

  final _names = [
    'Igor Minar',
    'Brad Green',
    'Dave Geddes',
    'Naomi Black',
    'Greg Weber',
    'Dean Sofer',
    'Wes Alvaro',
    'John Scott',
    'Daniel Nadasi',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new MaterialSearch<String>(
        //placeholder of the input and of the search bar text input
        placeholder: 'Search',
        limit: 100,
        getResults: (String criteria) async {
          var list = await _fetchList(criteria);
          return list.map((name) =>
          new MaterialSearchResult<String>(
            value: name, //The value must be of type <String>
            text: name, //String that will be show in the list
            icon: Icons.person,
          )).toList();
        },
        filter: (String value, String criteria) {
          return value.toString().toLowerCase().trim()
              .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
        },
        onSelect: (String selected) {
          if (selected == null) {
            return;
          }

          print("Selected: " + selected);
        },
      ),
    );
  }

  Future<List<String>> _fetchList(String criteria) {
    return new Future.value(_names);
  }


}