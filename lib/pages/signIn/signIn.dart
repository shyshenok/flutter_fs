import 'package:flutter/material.dart';
import 'package:flutter_fs/pages/signIn/singInBody.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Findy Vindy"),
          new SingInBody(),
        ],
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 56.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(title,
          style:const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 30.0
          ),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF00CCFF),
              const Color(0xFFE6E78D),
              const Color(0xFF228ba0)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.1, 0.5, 1.0],
            tileMode: TileMode.clamp
        ),
        boxShadow: <BoxShadow>[
          new BoxShadow (
            color: const Color(0xcc363636),
            offset: new Offset(0.0, 1.0),
            blurRadius: 4.0,
          )
        ],
      ),
    );
  }
}