import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/searchBar.dart';
import 'package:flutter_fs/utils/detailsFilmResponse.dart';
import 'package:flutter_fs/utils/detailsMovieItem.dart';
import 'package:flutter_fs/utils/findFilmResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class SearchForItem extends StatefulWidget {

  String refKey;


  SearchForItem({this.refKey});

  @override
  State createState() => new _SearchForItemState(this.refKey);
}

class _SearchForItemState extends State<SearchForItem> {

  List <FindFilmResponse> _data = new List <FindFilmResponse>();

  DatabaseReference reference;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SearchBar searchBar;

  _SearchForItemState(String refKey) {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onNewItems: onNewData
    );
    reference =
        FirebaseDatabase.instance.reference().child('list/movies').child(
            refKey);
  }


  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Bar Demo'),
        actions: [searchBar.getSearchAction(context)]
    );
  }

  void onSubmitted(String value) {
    print(value);
    setState(() =>
        _scaffoldKey.currentState
            .showSnackBar(
            new SnackBar(content: new Text('You wrote $value!'))));
  }

  void onNewData(Response data) {
    _data.clear();
    _data.addAll(data.results);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            print(_data[index].posterPath);

            return new Card(
              child: new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new GestureDetector (
                  onTap: () {
                    print('hello');
                    getDetailsRequest(_data[index]);
                  },
                  child: new Row(
                    children: <Widget>[
                      _data[index].posterPath != null ?
                      new Image(
                          image: new CachedNetworkImageProvider(
                              'https://image.tmdb.org/t/p/w500/' +
                                  _data[index].posterPath),
                          height: 150.00,
                          width: 100.00
                      ) : new Container(),
                      new Flexible(
                          child: new Column(

                            children: <Widget>[
                              new Container(
                                padding: new EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: new Text(
                                    _data[index].title, maxLines: 1),
                              )
                            ],
                          )
                      ),
                    ],
                  ),

                ),
              ),
            );
          }
      ),
    );
  }


  getDetailsRequest(FindFilmResponse data) async {
    final apiKey = 'd59e2b0b45e54e54737b34e64dd843b3';
    http
        .get(
        'https://api.themoviedb.org/3/movie/' + data.id.toString() + '?api_key=' +
            apiKey +
            '&language=ru&include_image_language=ru')
        .then((response) => response.body)
        .then(JSON.decode)
        .then((res) => new DetailFilmResponse.fromJson(res))
        .then((detailFilmResponse) {
      final movie = new DetailsMovieItem (
          detailFilmResponse.title,
          detailFilmResponse.posterPath,
          detailFilmResponse.genres,
          detailFilmResponse.runtime,
          detailFilmResponse.overview,
          detailFilmResponse.voteAverage,
          detailFilmResponse.voteCount,
          detailFilmResponse.releaseDate
      );


      final movieToJson = movie.toJson();
      reference.child("movies").push().set(movieToJson);
      //add to firebase
      //navigate to detail list movies
    });
  }
}