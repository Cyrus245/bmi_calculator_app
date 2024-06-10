import 'package:flutter/cupertino.dart';
import "../constants.dart";

class ReuseableIcon extends StatelessWidget {
  final IconData? iconName;
  final String? iconText;

  const ReuseableIcon({this.iconName, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconText ?? '',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
