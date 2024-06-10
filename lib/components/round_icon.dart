import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final double size;
  RoundIconButton({
    required this.icon,
    required this.onPressed,
    this.size = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: size, height: size),
    );
  }
}
