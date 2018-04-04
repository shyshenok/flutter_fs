import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/pages/addingFilmModalDialog.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/detailListOfMovies/detailListofMovies.dart';
import 'package:flutter_fs/utils/listOfLists.dart';

typedef void OnMovieLongTap(ListOfLists item);


class MoviesList extends StatefulWidget {

  final OnMovieLongTap onLongTapCallback;

  MoviesList(this.onLongTapCallback);

  @override
  _MoviesListState createState() => new _MoviesListState(this.onLongTapCallback);
}

class _MoviesListState extends State<MoviesList> {

  final OnMovieLongTap onLongTapCallback;

  final mainReference = FirebaseDatabase.instance.reference().child('list/movies');

  List <ListOfLists> _data = new List <ListOfLists>();

  _MoviesListState(this.onLongTapCallback) {
    mainReference.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    setState(() {
      _data.add(new ListOfLists.fromSnapshot(event.snapshot));
    });
  }

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
            new ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    child: new Column(
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => new DetailListOfMovies(data: _data[index]),
                                  ),
                                );
                              },
                                onLongPress: () {
                                  onLongTapCallback(_data[index]);
                                },
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  height: 48.00,
                                  padding: new EdgeInsets.symmetric(
                                      horizontal: 16.00
                                  ),
                                  child: new Text(
                                    '${_data[index].listName}',
                                    style: new TextStyle(
                                      fontSize: 16.00,
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),

                        new Container(
                          height: 3.00,
                          color: const Color(0x00000000),
                        ),


                      ],
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
                      _showDialog();
                    }
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


