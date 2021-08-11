import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.hgt, this.wt});
  double _bmi;
  final int hgt;
  final int wt;
  String BMIcalculate() {
    _bmi = wt / pow(hgt / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getSuggetion() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more. ";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "You have a Normal body weight. Good Job.";
    } else {
      return "You have a lower than normal body weight. You  can eat a bit more.";
    }
  }
}
