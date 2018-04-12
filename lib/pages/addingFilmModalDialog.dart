import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs/utils/listOfLists.dart';
import 'package:flutter_fs/utils/usersManager.dart';


typedef void OnClickOk(String item);

class TextModalDialog extends StatefulWidget {

  String currentName;
  final Color textColor;
  final OnClickOk clickOk;
  bool ifHasName;

  TextModalDialog(this.currentName, this.clickOk, this.ifHasName,
      this.textColor);

  @override
  State createState() =>
      new _TextModalDialogState(
          this.currentName, this.clickOk, this.ifHasName, this.textColor);
}

class _TextModalDialogState extends State<TextModalDialog> {
  TextEditingController _listName;
  String currentName;
  bool ifHasName;
  Color buttonDisabledColor;
  final OnClickOk ckickOk;
  Color textColor;

  _TextModalDialogState(this.currentName, this.ckickOk, this.ifHasName,
      this.textColor) {
    _listName = new TextEditingController(text: currentName);
    textColor = Colors.grey.shade300;
  }


  @override
  Widget build(BuildContext context) {
    return new _SystemPadding(
      child: new AlertDialog(
        contentPadding: new EdgeInsets.symmetric(
            vertical: 8.00,
            horizontal: 22.00),
        title: new Text("Create new list"),
        content: new Container(
          width: 300.0,
          height: 100.0,
          child: new Center(
            child: new TextField(
              onChanged: ifFullName,
              controller: _listName,
              autocorrect: true,
              maxLength: 150,
              maxLines: 1,
              decoration: new InputDecoration(
                hintText: 'Type list name (at least 3 letters)',
                labelText: 'List name',

              ),
            ),
          ),
        ),
        actions: <Widget>[
          new SimpleDialogOption(
            child: new FlatButton(
                textColor: textColor,
                onPressed: () {
                  ifHasName ? ckickOk(_listName.text) : null;
                  ifHasName ? Navigator.pop(context) : null;
                },
                child: new Text(
                    'Save',
                    style: new TextStyle(
                      fontSize: 22.00,
                    )
                )
            ),
          )
        ],
      ),
    );
  }

  void ifFullName(String text) {
    if (text.length >= 3) {
      setState(() {
        textColor = new Color(0xFF228ba0);
      });
      ifHasName = true;
    } else {
      setState(() {
        textColor = Colors.grey.shade300;
      });
      ifHasName = false;
    }
  }

}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 150),
        child: child);
  }
}