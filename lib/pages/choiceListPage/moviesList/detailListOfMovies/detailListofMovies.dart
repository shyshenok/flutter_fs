import 'package:flutter/material.dart';
import 'package:flutter_fs/utils/listOfLists.dart';
import 'package:meta/meta.dart';



class DetailListOfMovies extends StatelessWidget {

  final ListOfLists data;

  DetailListOfMovies({@required this.data});

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