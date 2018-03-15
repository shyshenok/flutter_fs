import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';


class SingInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .buttonColor;
    return new Expanded(
        child: new Container(
            child: new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new LoginIconsButton(new Icon(Icons.call, color: color), 'CALL'),

                  ],
                )
            )
        )

    );
  }
}

class LoginIconsButton extends StatelessWidget {

  final googleSignIn = new GoogleSignIn();
  final Icon icon;
  final String string;

  LoginIconsButton(this.icon, this.string);

  @override
  Widget build(BuildContext context) {
     Color color = Theme
        .of(context)
        .buttonColor;
    return new GestureDetector(
//        onTap: _clickedButton,
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: new EdgeInsets.symmetric(
            vertical: 8.00,
            horizontal: 12.00
        ),
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.all(
            const Radius.circular(2.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow (
              color: const Color(0xcc363636),
              offset: new Offset(0.0, 2.0),
              blurRadius: 4.0,
            )
          ],
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            this.icon,
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new Text(
                this.string,
                style: new TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
