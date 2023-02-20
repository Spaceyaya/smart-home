import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarthome/screens/home_mode_Activation_screen/home_mode_screen.dart';
import 'package:smarthome/screens/home_screen/components/power_data_usage.dart';

import '../../../components/default_underline.dart';
import '../../../consts.dart';
import 'divider.dart';

class GreetingAndHomeModeActivation extends StatelessWidget {
  const GreetingAndHomeModeActivation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20 / 820 * height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5 / 411 * width),
            child: Text(
              'Hello Islam',
              style: TextStyle(
                  fontFamily: 'arial',
                  fontWeight: FontWeight.bold,
                  fontSize: 31 / 411 * width),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3 / 411 * width),
            child: DefaultUnderline(
                heightU: 2 / 820 * height, widthU: 30 / 411 * width),
          ),
          SizedBox(
            height: 2 / 820 * height,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5 / 411 * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home Mode Activated',
                  style: TextStyle(
                      fontFamily: 'arial',
                      fontSize: 22 / 411 * width,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40 / 411 * width),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, HomeModeActivationScreen.routeName),
                    child: SvgPicture.asset(
                      'assets/icons/switch-38.svg',
                      color: const Color(0xff2ab0f1),
                    ),
                  ),
                )
              ],
            ),
          ),
          const PowerDataUsage(),
          const Divied(),
        ],
      ),
    );
  }
}
