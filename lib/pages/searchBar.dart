import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fs/utils/findFilmResponse.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

typedef void OnNewItems(Response listOfItems);
typedef AppBar AppBarCallback(BuildContext context);
typedef void TextFieldSubmitCallback(String value);
typedef void SetStateCallback(void fn());

class SearchBar {
  final bool inBar;
  final bool colorBackButton;
  final bool closeOnSubmit;
  final bool clearOnSubmit;
  final AppBarCallback buildDefaultAppBar;
  final TextFieldSubmitCallback onSubmitted;
  final SetStateCallback setState;
  final bool showClearButton;
  final subject = new PublishSubject<String>();
  final OnNewItems onNewItems;

  String apiKey;
  String hintText;
  TextEditingController controller;
  bool _isSearching = false;
  bool _clearActive = false;
  AppBar _defaultAppBar;

  SearchBar({
    @required this.setState,
    @required this.buildDefaultAppBar,
    @required this.onNewItems,
    this.onSubmitted,
    this.controller,
    this.apiKey = 'd59e2b0b45e54e54737b34e64dd843b3',
    this.hintText = 'Search',
    this.inBar = false,
    this.colorBackButton = true,
    this.closeOnSubmit = true,
    this.clearOnSubmit = true,
    this.showClearButton = true
  }) {
    if (this.controller == null) {
      this.controller = new TextEditingController();
    }

    if (!this.showClearButton) {
      return;
    }

    this.controller.addListener(() {
      if (this.controller.text.isEmpty) {
        if (_clearActive) {
          setState(() {
            _clearActive = false;
          });
        }
        print(controller.text);

        return;
      }

      if (!_clearActive) {
        setState(() {
          _clearActive = true;
        });
      }
    });

    subject.stream.debounce(new Duration(milliseconds: 800)).listen(
        getListMovies);
  }

  bool get isSearching => _isSearching;

  void beginSearch(context) {
    print(context);
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
        onRemove: () {
          setState(() {
            _isSearching = false;
          });
        }
    ));

    setState(() {
      _isSearching = true;
    });
  }

  AppBar buildAppBar(BuildContext context) {
    _defaultAppBar = buildDefaultAppBar(context);

    return _defaultAppBar;
  }

  AppBar buildSearchBar(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color barColor = inBar ? _defaultAppBar.backgroundColor : theme.canvasColor;

    Color buttonColor = inBar ? null : (colorBackButton ? _defaultAppBar
        .backgroundColor ?? theme.primaryColor ?? Colors.grey.shade400 : Colors
        .grey.shade400);
    Color buttonDisabledColor = inBar
        ? new Color.fromRGBO(255, 255, 255, 0.25)
        : Colors.grey.shade300;

    Color textColor = inBar ? Colors.white70 : Colors.black54;

    return new AppBar(
      leading: new BackButton(
          color: buttonColor
      ),
      backgroundColor: barColor,
      title: new Directionality(
          textDirection: Directionality.of(context),
          child: new TextField(
            controller: controller,
            style: new TextStyle(
                color: textColor,
                fontSize: 16.0
            ),
            decoration: new InputDecoration(
                hintText: hintText,
                hintStyle: new TextStyle(
                    color: textColor,
                    fontSize: 16.0
                ),
                border: InputBorder.none
            ),
            onChanged: (String value) {
              (subject.add(value));
            },
            onSubmitted: (String val) async {
              if (closeOnSubmit) {
                await Navigator.maybePop(context);
              }

              if (clearOnSubmit) {
                controller.clear();
              }

              onSubmitted(val);
            },
            autofocus: true,
          )
      ),
      actions: !showClearButton ? null : <Widget>[
        new IconButton(
            icon: new Icon(Icons.clear,
                color: _clearActive ? buttonColor : buttonDisabledColor),
            disabledColor: buttonDisabledColor,
            onPressed: !_clearActive ? null : () {
              controller.clear();
            })
      ],
    );
  }

  IconButton getSearchAction(BuildContext context) {
    return new IconButton(
        icon: new Icon(Icons.search),
        onPressed: () {
          beginSearch(context);
        }
    );
  }

  AppBar build(BuildContext context) {
    return _isSearching ? buildSearchBar(context) : buildAppBar(context);
  }

  getListMovies(String value) async {
    final response = http.get(
        'https://api.themoviedb.org/3/search/movie?api_key=' + apiKey +
            '&query=' + value +
            '&language=ru&include_image_language=ru')
        .then((response) => response.body)
        .then(JSON.decode)
        .then((res) => new Response.fromJson(res))
        .then(onNewItems);

    print(response);
  }


}
