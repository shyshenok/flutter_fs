import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/utils/usersManager.dart';


class MoviesList extends StatelessWidget {


  @override
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
            new Positioned (
              right: 16.0,
              bottom: 16.0,
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

  void saveListName(String text) {
    print(text);
    reference.push().set({
      'text': text,
      'owner': new UserManager().googleSignIn.currentUser.id
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      contentPadding: new EdgeInsets.symmetric(
          vertical: 8.00,
          horizontal: 22.00),
      title: new Text("Create new list"),
      children: <Widget>[
        new Container(
          width: 300.0,
          height: 100.0,
          child: new Center(
            child: new TextField(
              controller: _listName,
              autocorrect: true,
              maxLength: 255,
              maxLines: 1,
              decoration: new InputDecoration(
                  hintText: 'Type list name',
                  labelText: 'List name'
              ),
            ),
          ),
        ),
        new SimpleDialogOption(
          child: new FlatButton(
              onPressed: () {
                saveListName(_listName.text);
                Navigator.pop(context);
              },
              child: new Text('Save')
          ),
        )
      ],
    );
  }
}