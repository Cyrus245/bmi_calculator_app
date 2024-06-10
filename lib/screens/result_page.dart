import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../components/reusable_card.dart";
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  const ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonText: "RE-CALCULATE", onTap: () => {Navigator.pop(context)})
        ],
      ),
    );
  }
}
