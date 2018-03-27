import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class MoviesList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold (

      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Positioned (
              right: 24.0,
              bottom: 24.0,
              child: new Container(
                child: new FloatingActionButton(
                    elevation: 6.0,
                    child: new Icon(Icons.add),
                    backgroundColor: new Color(0xFF228ba0),
                    onPressed: () {
                      showDialog(
                          context: context,
                          child: new CreateMoviesList()
                      );
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateMoviesList extends StatefulWidget {
  @override
  State createState() => new CreateMoviesListState();
}

class CreateMoviesListState extends State<CreateMoviesList> {
  final reference = FirebaseDatabase.instance.reference().child('list');
  final TextEditingController _listName = new TextEditingController();

  void saveListName( String text ) {
    print(text);
    reference.push().set({
      'text': text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Create new list"),
      content: new TextField(
        autocorrect: true,
        maxLength: 255,
        maxLines: 1,
        decoration: new InputDecoration(
          hintText: 'Type list name',
          labelText: 'List name'
        ),
        controller: _listName,
        onChanged: (String text) {
          print(_listName.text);
        },
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {saveListName(_listName.text);},
            child: new Text('Save')
        ),
      ],
    );
  }
}