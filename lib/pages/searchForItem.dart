import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/searchBar.dart';
import 'package:flutter_fs/utils/detailsFilmResponse.dart';
import 'package:flutter_fs/utils/findFilmResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SearchForItem extends StatefulWidget {

  SearchForItem();

  @override
  State createState() => new _SearchForItemState();
}

class _SearchForItemState extends State<SearchForItem> {

  List <FindFilmResponse> _data = new List <FindFilmResponse>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SearchBar searchBar;

  _SearchForItemState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onNewItems: onNewData
    );
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
                    getDetailsRequest(_data[index].id);
                  },
                  child: new Row(
                    children: <Widget>[
                      _data[index].posterPath != null ?
                      new Image.network('https://image.tmdb.org/t/p/w500/' +
                          _data[index].posterPath,
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


  getDetailsRequest(int id) async {
    final apiKey = 'd59e2b0b45e54e54737b34e64dd843b3';
    http
        .get(
        'https://api.themoviedb.org/3/movie/' + id.toString() + '?api_key=' +
            apiKey +
            '&language=ru&include_image_language=ru')
        .then((response) => response.body)
        .then(JSON.decode)
        .then
      ((response) {
      print('hello');
    })
        .then((res) => new DetailFilmResponse.fromJson(res))
        .then((detailFilmResponse) {
      print('hello');
    });
  }
}