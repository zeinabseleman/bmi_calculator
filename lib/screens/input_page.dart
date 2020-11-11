
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import '../component/Icon_Content.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:bmi_calculator/component/bottom_button.dart';



enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   int height = 180;
   int weight = 60;
   int age = 20;
  Gender selectedGender ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATO'
            'R')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                      child: ReusableCard(
                        onpress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                          color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor ,
                          childCard: IconContent( icon:  FontAwesomeIcons.mars , label:'MALE' ,)
                      ),


                ),
                Expanded(
                      child: ReusableCard(
                          onpress: (){
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                          childCard :IconContent( icon:  FontAwesomeIcons.venus , label:'FEMALE' ,)
                      ),

                )
              ],
            ),
          ),
          Expanded(
                child:  ReusableCard(
                    color: activeCardColor,
                    childCard: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'HEIGHT',
                            style: labelTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,

                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: numberTextStyle ,
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            //activeColor: Colors.white ,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor:Color(0xFF8D8E98) ,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),

                          ),
                          child: Slider(
                              value: height.toDouble() ,
                              min: 120.0,
                              max: 220.0 ,
                              onChanged: (double newvalue){
                                setState(() {
                                  height = newvalue.round();
                                });

                              }
                          ),
                        )
                      ],
                    ),
                ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  ReusableCard(
                      color: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            roundIconButton(icon: FontAwesomeIcons.minus,
                            onpress: (){
                              setState(() {
                                weight-- ;
                              });
                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            roundIconButton(icon: FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                weight++ ;
                              });
                            },
                            )
                          ],
                        ),
                      ],
                    ),

                  ),
                ),
                Expanded(
                  child:   ReusableCard(
                      color: activeCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              roundIconButton(icon: FontAwesomeIcons.minus,
                               onpress: (){
                                  setState(() {
                                    age-- ;
                                  });
                               },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              roundIconButton(icon: FontAwesomeIcons.plus,
                                onpress: (){
                                  setState(() {
                                    age++ ;
                                  });
                                },
                              ),

                            ],
                          )
                        ],
                      ),
                  ),
                )
              ],
            ),
          ),
           BottomButton( buttonTitle: 'CALCULATE',
             ontap:(){

             CalculatorBrain calc = CalculatorBrain(height: height , weight:  weight);

               Navigator.push(context,MaterialPageRoute(builder:(context) => ResultsPage(
                 bmiResult:calc.CalculateBMI() ,
                 resultText:calc.getResult(),
                 interpretation: calc.getInterpretation(),
               ),
               ),
               );
             },
           ),
        ],
      ),
    );
  }
}



