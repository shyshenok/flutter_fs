import 'package:flutter/material.dart';


class SingInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: Colors.blue,
          child: new Center(
              child: new Text(
                'Hello, worldттткккккт124!',
              )
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

  Row buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
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

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _clickedButton,
    );
  }
}