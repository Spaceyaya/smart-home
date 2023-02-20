import 'package:flutter/material.dart';

import '../../../consts.dart';

class ModesOptions extends StatelessWidget {
  const ModesOptions({
    Key? key,
    required this.roomName,
    required this.isOff,
    required this.press,
  }) : super(key: key);
  final String roomName;
  final bool isOff;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4 / 820 * height),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              roomName,
              style: TextStyle(
                  fontSize: 16 / 411 * width,
                  fontFamily: 'arial',
                  color: Colors.black),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: press,
            child: Padding(
                padding: EdgeInsets.only(right: 45 / 411 * width),
                child: isOff
                    ? Text(
                        'OFF',
                        style: TextStyle(
                            fontSize: 16 / 411 * width,
                            color: const Color.fromARGB(255, 189, 189, 189)),
                      )
                    : Text(
                        'ON',
                        style: TextStyle(
                            fontSize: 16 / 411 * width,
                            color: const Color(0xff2AB0F1)),
                      )),
          )
        ],
      ),
    );
  }
}
// Color(0xff2AB0F1)