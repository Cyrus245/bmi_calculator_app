import 'package:flutter/material.dart';
import "../constants.dart";

class BottomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const BottomButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonText, style: kLargeButtonTextStyle),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        height: 80.0,
      ),
    );
  }
}
