import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/searchBar.dart';


class SearchForItem extends StatefulWidget {

  SearchForItem();

  @override
  State createState() => new _SearchForItemState();
}

class _SearchForItemState extends State<SearchForItem> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SearchBar searchBar;

  _SearchForItemState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);

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



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
    );
  }

}



//'https://api.themoviedb.org/3/search/movie?api_key=' + this.apiKey + '&query=' +
//o.title.replace(" ", '+') + "&language=ru&include_image_language=ru"


//  apiKey: string = 'd59e2b0b45e54e54737b34e64dd843b3';
