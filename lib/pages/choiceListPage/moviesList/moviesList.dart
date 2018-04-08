import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_fs/pages/addingFilmModalDialog.dart';
import 'package:flutter_fs/pages/choiceListPage/moviesList/detailListOfMovies/detailListofMovies.dart';
import 'package:flutter_fs/utils/listOfLists.dart';

typedef void OnMovieLongTap(ListOfLists item);

typedef bool IsSelected(ListOfLists item);

class MoviesList extends StatefulWidget {

  final OnMovieLongTap onLongTapCallback;
  final WillPopCallback onBackPress;
  final IsSelected isSelected;


  MoviesList(this.onLongTapCallback, this.onBackPress, this.isSelected);

  @override
  _MoviesListState createState() =>
      new _MoviesListState(
          this.onLongTapCallback, this.onBackPress, this.isSelected);
}

class _MoviesListState extends State<MoviesList> {

  final OnMovieLongTap onLongTapCallback;
  final WillPopCallback onBackPress;
  final IsSelected isSelected;
  final mainReference = FirebaseDatabase.instance.reference().child(
      'list/movies');


  List <ListOfLists> _data = new List <ListOfLists>();

  _MoviesListState(this.onLongTapCallback, this.onBackPress, this.isSelected) {
    mainReference.onChildAdded.listen(_onEntryAdded);
    mainReference.onChildRemoved.listen(_onEntryRemoved);
  }

  _onEntryAdded(Event event) {
    setState(() {
      _data.add(new ListOfLists.fromSnapshot(event.snapshot));
    });
  }

  _onEntryRemoved(Event event) {
    setState(() {
      _data.removeWhere((item) => item.key == event.snapshot.key);
    });
  }

  Widget _ifHasItemInList() {
    return new ListView.builder(
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
                              pageBuilder: (_, __, ___) =>
                              new DetailListOfMovies(
                                  data: _data[index]),
                            ),
                          );
                        },
                        onLongPress: () {
                          onLongTapCallback(_data[index]);
                        },
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: isSelected(_data[index])
                                  ? <BoxShadow>[
                                new BoxShadow (
                                  color: const Color(0xcc333333),
                                  offset: new Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ] : null

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
    );
  }

  Widget _ifHasNotItemInList() {
    return new Container(
      child: new Center(
        child: new Container(
          padding: new EdgeInsets.symmetric(
              horizontal: 16.00,
            vertical: 4.0
          ),
          color: new Color(0x88ffffff),
          child: new Text('Create your first list!',
              style: new TextStyle(
                  fontSize: 22.00,
                  color: new Color(0xFF228ba0)
              )
          ),
        ),
      ),
    );
  }

  bool selectedContainer(List <ListOfLists> _data) {
    return _data != null && _data.isNotEmpty;
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

            selectedContainer(_data) ? _ifHasItemInList()
                : _ifHasNotItemInList(),

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
        child: new CreateListModalDialog(null)
    );
  }
}


