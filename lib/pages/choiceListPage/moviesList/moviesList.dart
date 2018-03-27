
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
                    onPressed: () {
                      showDialog(context: context, child:
                      new AlertDialog(
                        title: new Text("My Super title"),
                        content: new Text("Hello World"),
                      )
                      );
                    }
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

