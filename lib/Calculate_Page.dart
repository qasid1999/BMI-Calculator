import 'package:flutter/material.dart';
import 'Constants.dart';

class CalculatePage extends StatelessWidget {
  CalculatePage({@required this.ontap, @required this.text});
  final Function ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: kbottomcolor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomhight,
        child: Center(
          child: Text(
            text,
            style: kCalculateButtonStyle,
          ),
        ),
      ),
    );
  }
}
