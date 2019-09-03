import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String getBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "OverWeight";
    }else if(_bmi >= 18.0){
      return "Normal";
    }else {
      return "UnderWeight";
    }

  }

  String getadvice (){

    if(_bmi >= 25){
      return "i think you need to exercise more";
    }else if(_bmi >= 18.0){
      return "Congratlations you have a perfect body , Stay healthy";
    }else {
      return "you are UnderWeight you need to eat more Good luck,";
    }

  }

}