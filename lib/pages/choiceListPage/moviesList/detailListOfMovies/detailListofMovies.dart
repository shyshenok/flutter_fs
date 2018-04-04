import 'package:flutter/material.dart';
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
    );
  }


}