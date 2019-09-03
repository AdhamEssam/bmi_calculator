import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String buttontiltle;

  BottomButton({@required this.ontap, @required this.buttontiltle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: kBinkColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerhight,
        child: Center(
          child: Text(
            buttontiltle,
            style:klargebuttonstyle,
          ),
        ),
      ),
    );
  }
}