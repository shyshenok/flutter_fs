import 'package:flutter/material.dart';


class SingInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: Colors.blue,
          child: new Center(
              child: new LoginIconsButton()
          )
      )

    );
  }
}

class LoginIconsButton extends StatefulWidget{
  _SelecteLogInAccount createState() => new _SelecteLogInAccount();
}

class _SelecteLogInAccount extends State<LoginIconsButton> {
  bool _ifClicked = false;

  void _clickedButton() {
    setState(() {
        _ifClicked = !_ifClicked;
    });
  }
  @override
  Widget build(BuildContext context) {

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).buttonColor;
      Color clickedColor = Colors.red;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new IconButton(
              icon: new Icon(icon),
              color: (_ifClicked ? color : clickedColor),
              onPressed: _clickedButton
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
    return new GestureDetector(
      onTap: _clickedButton,
      child: new Container(
        child: new Row(
          children: [
            buildButtonColumn(Icons.call, 'CALL',),
          ]
        ),
      ),
    );
  }
}