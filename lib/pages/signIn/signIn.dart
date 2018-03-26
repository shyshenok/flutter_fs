import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/singInBody.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xFF228ba0),
        title: new Text("Findy Vindy"),
          automaticallyImplyLeading: false
      ),
      body: new Column(
        children: <Widget>[
          new SingInBody(),
        ],
      ),
    );
  }
}
