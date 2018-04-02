import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs/utils/listOfLists.dart';
import 'package:flutter_fs/utils/usersManager.dart';


class CreateListModalDialog extends StatefulWidget {
  @override
  State createState() => new CreateListModalDialogState();
}

class CreateListModalDialogState extends State<CreateListModalDialog> {
  final reference = FirebaseDatabase.instance.reference().child('list');
  final TextEditingController _listName = new TextEditingController();


  void saveListName(String listName) {
    final entry = new ListOfLists(
        listName, new UserManager().googleSignIn.currentUser.id);

    reference.push().set(entry.toJson());
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
              controller: _listName,
              autocorrect: true,
              maxLength: 150,
              maxLines: 1,
              decoration: new InputDecoration(
                  hintText: 'Type list name',
                  labelText: 'List name'
              ),
            ),
          ),
        ),
        actions: <Widget>[
          new SimpleDialogOption(
            child: new FlatButton(
                onPressed: () {
                  saveListName(_listName.text);
                  Navigator.pop(context);
                },
                child: new Text(
                    'Save',
                    style: new TextStyle(
                        fontSize: 22.00,
                        color: new Color(0xFF228ba0)
                    )
                )
            ),
          )
        ],
      ),
    );
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