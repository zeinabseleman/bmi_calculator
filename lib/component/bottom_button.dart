import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle , @required this.ontap});
  final String buttonTitle;
  final Function ontap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap ,
      child: Container(
        child: Center(child: Text(buttonTitle , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),)),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}