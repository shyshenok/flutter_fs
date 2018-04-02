import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/pages/addingFilmModalDialog.dart';
import 'package:flutter_fs/utils/listOfLists.dart';


class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => new _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {

  final mainReference = FirebaseDatabase.instance.reference().child('list');

  List <ListOfLists> _data = new List <ListOfLists>();

  _MoviesListState() {
    mainReference.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      _data.add(new ListOfLists.fromSnapshot(event.snapshot));
    });
  }

  @override
  void initState() {
    setState(() {

    });
  }


  Widget build(BuildContext context) {
    return new Scaffold (

      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Stack(
          children: <Widget>[
            new ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Text('${_data[index].listName}'),
                        ],
                      ),
                    ),
                  );
                }
            ),
            new Positioned (
              right: 16.0,
              bottom: 16.0,
              child: new Container(
                child: new FloatingActionButton(
                    elevation: 6.0,
                    child: new Icon(Icons.add),
                    backgroundColor: new Color(0xFF228ba0),
                    onPressed: () {_showDialog();}
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
        context: context,
        child: new CreateListModalDialog()
    );
  }
}


