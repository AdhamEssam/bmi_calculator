import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/screens/Result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(

          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        ),
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => HomePage(),
        'resultpage':(context)=> ResultPage(),
      },
    );
  }
}


