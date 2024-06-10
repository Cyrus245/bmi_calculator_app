import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../components/reusable_card.dart";
import "../components/reusable_icon.dart";
import "../constants.dart";
import "./result_page.dart";
import "../components/bottom_button.dart";
import "../components/round_icon.dart";
import "../calculator.dart";

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCardColor = kInactiveCardColor;
  Color maleCardColor = kInactiveCardColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ResuableCard(
                  onPress: () => {
                        setState(() {
                          selectedGender = Gender.male;
                        })
                      },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: ReuseableIcon(
                    iconName: FontAwesomeIcons.mars,
                    iconText: "male",
                  )),
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              child: ResuableCard(
                colour: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: ReuseableIcon(
                  iconName: FontAwesomeIcons.venus,
                  iconText: "Female",
                ),
              ),
            )),
          ],
        )),
        Expanded(
            child: ResuableCard(
          colour: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: kNumberStyle,
                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ),
              )
            ],
          ),
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ResuableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberStyle,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ResuableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    colour: kActiveCardColor)),
          ],
        )),
        BottomButton(
            buttonText: "CALCULATE",
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            })
      ]),
    );
  }
}
