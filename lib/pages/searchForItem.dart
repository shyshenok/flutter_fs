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
      body: new Center(
              child: new FutureBuilder<FindFilmResponse>(
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return new Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner
                    return new CircularProgressIndicator();
                },
              ),
            ),

// new ListView.builder(
//          itemCount: _data.length,
//          itemBuilder: (BuildContext context, int index) {
//            return new Container(
//              child: new FutureBuilder<FindFilmResponse>(
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
//                    return new Text(snapshot.data.title);
//                  } else if (snapshot.hasError) {
//                    return new Text("${snapshot.error}");
//                  }
//
//                  return new CircularProgressIndicator();
//                },
//              ),
//            );
//          }
//      ),
    );
  }
}
