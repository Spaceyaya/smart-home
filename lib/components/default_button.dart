import 'package:flutter/material.dart';
import 'package:smarthome/consts.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.widthBtn,
    required this.color,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final double widthBtn;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBtn,
      height: 52 / 820 * height,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16 / 411 * width,
          ),
        ),
      ),
    );
  }
}
