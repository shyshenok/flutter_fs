import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/searchForItem.dart';
import 'package:flutter_fs/utils/listOfLists.dart';
import 'package:meta/meta.dart';



class DetailListOfMovies extends StatefulWidget {

  final ListOfLists data;

  DetailListOfMovies({Key key, @required this.data}): super(key: key);

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
                      _openSearchForItemDialog(data.key);
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openSearchForItemDialog(String key) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new SearchForItem(refKey: key);
        },
        fullscreenDialog: true
    ));
  }
}