import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/searchBar.dart';
import 'package:flutter_fs/utils/findFilmResponse.dart';


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
    setState((){});
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
            return new Card(
                child: new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Row(
                      children: <Widget>[
//                        _data[index].posterPath != null? new Image.network(_data[index].posterPath): new Container(),
                        new Flexible(
                          child: new Text(_data[index].title, maxLines: 10),
                        ),
                      ],
                    )
                )
            );
          },
        ),
    );
  }
}
