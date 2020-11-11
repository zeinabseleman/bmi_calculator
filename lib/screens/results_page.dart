import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/component/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult ,@required this.resultText ,@required  this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
           Expanded(
               child: Container(
                 padding: EdgeInsets.all(15.0),
                 alignment: Alignment.bottomLeft,
                 child: Text(
                   'Your Result',
                   style: titleYourResult,
                 ),
               )
           ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                color: activeCardColor,
                childCard: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: overweightText,
                    ),
                    Text(
                      bmiResult,
                      style: resultCalcText,
                    ),
                    Text(
                      interpretation,
                      style:bodyResulText ,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
            ontap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
