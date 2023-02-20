import 'package:flutter/material.dart';
import '../../../consts.dart';

class CreatNewModeBtn extends StatelessWidget {
  const CreatNewModeBtn({
    Key? key,
    required this.buttonName, required this.press,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: press ,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6 / 820 * height),
        padding: EdgeInsets.only(left: 25 / 411 * width, top: 7 / 820 * height),
        height: 151 / 820 * height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xfff9f9f9),
          border: Border.all(
              color: const Color(0xffd9d9d9).withOpacity(0.5),
              width: 2 / 411 * width),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 165 / 3 / 820 * height,
              horizontal: 450 / 4 / 411 * width),
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 16 / 411 * width),
          ),
        ),
      ),
    );
  }
}
