import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/Reuseple_card.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/ButtonButton.dart';
import 'package:bmi_calculator/widgets/RoundedIconButton.dart';
import 'package:bmi_calculator/screens/Result_page.dart';
import 'package:bmi_calculator/widgets/CalculatorBrain.dart';

//This is the Enum of the Gender
enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: <Widget>[
            //======= This is the first Row =======
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    //this is the male button
                    child: ReusebleCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActivemainColor
                          : kInactivemainColor,
                      cardChild: IconContent(
                        icoon: FontAwesomeIcons.mars,
                        iconsize: 80.0,
                        icoontext: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    //this is the female button
                    child: ReusebleCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActivemainColor
                          : kInactivemainColor,
                      cardChild: IconContent(
                        icoon: FontAwesomeIcons.venus,
                        icoontext: "Female",
                        iconsize: 80.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //==========this the second Row ==========
            Expanded(
              child: ReusebleCard(
                colour: kActivemainColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Height",
                      style: kLabeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabeltextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ======== This is the third Row ========
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusebleCard(
                        colour: kActivemainColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Weight",
                              style: kLabeltextstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  }
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusebleCard(
                      colour: kActivemainColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Age",style: kLabeltextstyle,),
                          Text(age.toString(),style: kNumStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),

                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            new BottomButton(buttontiltle: "Calculate", ontap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(
                    getbmi:calc.getBmi(),
                    getadvice: calc.getadvice(),
                    getresult: calc.getResult()
                );

              }));
            },
            ),
          ],
        ));
  }
}




