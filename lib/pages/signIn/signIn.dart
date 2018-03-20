import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/singInBody.dart';
import 'package:flutter_fs/pages/style/gradientAppBar.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("fs"),
          new SingInBody(),
        ],
      ),
    );
  }
}

