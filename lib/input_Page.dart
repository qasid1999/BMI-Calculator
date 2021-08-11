import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'Calculate_Page.dart';
import 'icon_Content.dart';
import 'resuld.dart';
import 'reusable_card.dart';
import 'Constants.dart';

import 'Brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedcolor;

//Color malecardcolor=inactiveColor;
//Color femalecardColor=inactiveColor;
/*void UpdationofColor(Gender gender)
{
  if(gender==Gender.male)
    {
      if(malecardcolor==inactiveColor)
     {
       malecardcolor=actioveColor;
      femalecardColor=inactiveColor;
    }else
      {
        malecardcolor=inactiveColor;

      }
    }
  if(gender==Gender.female)
    {
      if(femalecardColor==inactiveColor)
        {
      femalecardColor=actioveColor;
      malecardcolor=inactiveColor;
    }else{
        femalecardColor=inactiveColor;
      }
    }
}*/
  int height = 180;
  int weight = 40;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedcolor = Gender.male;
                      });
                    },
                    colour: selectedcolor == Gender.male
                        ? kactioveColor
                        : kinactiveColor,
                    cardchild: IconContent(
                      icon: FontAwesome.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedcolor = Gender.female;
                      });
                    },
                    colour: selectedcolor == Gender.female
                        ? kactioveColor
                        : kinactiveColor,
                    cardchild: IconContent(
                      icon: FontAwesome.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kactioveColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: ktextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: knumbertextstyle),
                      Text("cm", style: ktextstyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      divisions: 100,
                      label: height.toDouble().toString(),
                      // activeColor: Color(0xFFEB1555),
                      //inactiveColor: Color(0xFF8D8E98),

                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactioveColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: ktextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesome.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIcon(
                              icon: FontAwesome.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactioveColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: ktextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesome.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIcon(
                              icon: FontAwesome.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculatePage(
            ontap: () {
              // Navigator.pushNamed(context, '/first');
              CalculatorBrain calc =
                  new CalculatorBrain(hgt: height, wt: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiresult: calc.BMIcalculate(),
                    bmitextresult: calc.getResult(),
                    suggetion: calc.getSuggetion(),
                  ),
                ),
              );
            },
            text: "CALCULATE",
          ),
        ],
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({this.icon, this.onpressed});
  final Function onpressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
