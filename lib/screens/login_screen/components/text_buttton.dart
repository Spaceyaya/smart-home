import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    Key? key, required this.text, required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child:  Text(
        text,
        style:const TextStyle(color: Color.fromARGB(255, 1, 87, 158)),
      ),
    );
  }
}