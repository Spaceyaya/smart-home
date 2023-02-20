import 'package:flutter/material.dart';

import '../../../consts.dart';


class Divied extends StatelessWidget {
  const Divied({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 25 / 820 * height,
          right: 35 / 411 * width,
          left: 15 / 411 * width,
          bottom: 25 / 820 * height),
      height: 1,
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
    );
  }
}