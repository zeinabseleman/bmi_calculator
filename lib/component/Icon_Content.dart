import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';



class IconContent extends StatelessWidget {
  IconContent({this.icon , this.label});
  final icon ;
  final label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label , style: labelTextStyle )
      ],
    );
  }
}