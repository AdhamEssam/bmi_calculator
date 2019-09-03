import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/Reuseple_card.dart';
import '../widgets/ButtonButton.dart';

class ResultPage extends StatelessWidget {
  final String getbmi;
  final String getresult;
  final String getadvice;

  ResultPage({@required this.getbmi,@required this.getadvice,@required this.getresult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child:Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text("Your Result",
                style: kresultpagestyle,
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child: ReusebleCard(
              colour: kActivemainColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getresult.toUpperCase(),
                  style: kweightresultstyle,
                  ),
                  Text(getbmi,style: kBMInum,
                  ),
                  Text(getadvice,
                    style: kBmitext,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(
            buttontiltle: "RE-Calculate",
            ontap: (){
              Navigator.pop(context);

            },
          ),

        ],
      ),
    );
  }
}
