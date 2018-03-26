import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MoviesList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold (

      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Positioned (
              child: new Container(
                child: new FloatingActionButton(
                    elevation: 6.0,
                    child: new Icon(Icons.add),
                    backgroundColor: new Color(0xFF228ba0),
                    onPressed: () {}
                ),
              ),
              right: 24.0,
              bottom: 24.0,
            )
          ],
        ),
      ),
    );
  }
}