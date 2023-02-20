import 'package:flutter/material.dart';

import '../../../consts.dart';

class Divided extends StatelessWidget {
  const Divided({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 25 / 820 * height, bottom: 25 / 820 * height),
      height: 1,
      width: 450,
      color: Colors.black.withOpacity(0.2),
    );
  }
}
