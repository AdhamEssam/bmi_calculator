import 'package:flutter/material.dart';
import '../constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.icoon, @required this.icoontext, this.iconsize});
  final IconData icoon;
  final String icoontext;
  final iconsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icoon,
          size: iconsize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          icoontext,
          style: kLabeltextstyle,
        )
      ],
    );
  }
}