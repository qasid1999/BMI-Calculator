import 'package:bmi_calculator_flutter_app/reusable_card.dart';
import 'package:flutter/material.dart';

import 'Calculate_Page.dart';
import 'Constants.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiresult,
      @required this.bmitextresult,
      @required this.suggetion});
  final String bmiresult;
  final String bmitextresult;
  final String suggetion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: kresuclttextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactioveColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmitextresult.toUpperCase(),
                    style: ktext1style,
                  ),
                  Text(
                    bmiresult,
                    style: ktext2style,
                  ),
                  Text(
                    suggetion,
                    textAlign: TextAlign.center,
                    style: ktext3style,
                  ),
                ],
              ),
            ),
          ),
          CalculatePage(
            ontap: () {
              Navigator.pop(context);
            },
            text: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}
