import 'package:flutter/material.dart';
import 'Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: ktextstyle,
        ),
      ],
    );
  }
}
