import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts.dart';

class NewModesOptions extends StatelessWidget {
  const NewModesOptions({
    Key? key,
    required this.roomName,
    required this.on,
  }) : super(key: key);
  final String roomName, on;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40/411*width, right: 45/411*width),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/Group 102.svg',
            width: 16,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            roomName,
            style: TextStyle(
                fontSize: 16 / 411 * width,
                fontFamily: 'arial',
                color: Colors.black),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Text(
              on.toUpperCase(),
              style: TextStyle(
                  fontSize: 16 / 411 * width, color: const Color(0xff2AB0F1)),
            ),
          )
        ],
      ),
    );
  }
}
