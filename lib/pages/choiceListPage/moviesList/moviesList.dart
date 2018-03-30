import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/pages/addingFilmModalDialog.dart';


class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => new _MoviesListState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _MoviesListState extends State<MoviesList> {

  List <bool> _data = new List <bool>();

@override

void initState() {
  setState(() {
    for(int i =0; i<10; i++) {
      _data.add(false);
    }
  });
}

void _onChange(bool value, int index) {
  setState((){
_data[index] = value;
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
              itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Text(('jjjjjjjjjj ${index}')),
                  new CheckboxListTile(
                      value: _data[index],
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool value){_onChange(value, index);}
                  )
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          child: new CreateListModalDialog()
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

