import 'package:flutter/material.dart';

import '../../../consts.dart';

class PowerDataUsage extends StatelessWidget {
  const PowerDataUsage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30 / 820 * height),
      child: Row(
        children: [
          Image.asset(
            'assets/imgs/512px-Pokémon_Electric_Type_Icon.svg.png',
            width: 72 / 411 * width,
            height: 72 / 820 * height,
          ),
          SizedBox(
            width: 30 / 411 * width,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 17 / 411 * width),
                child: Text(
                  '37.3 KWH',
                  style: TextStyle(
                      fontFamily: 'arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 25 / 411 * width),
                ),
              ),
              Text(
                'Today - Power usage',
                style: TextStyle(
                    fontFamily: 'arial',
                    fontSize: 14 / 411 * width,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
