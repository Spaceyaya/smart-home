import 'package:flutter/material.dart';

import '../../../components/default_underline.dart';
import '../../../consts.dart';

class MostUsedControllsTitle extends StatelessWidget {
  const MostUsedControllsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Used Controlls',
          style: TextStyle(
              fontFamily: 'arial',
              fontSize: 31 / 411 * width,
              color: Colors.black.withOpacity(0.5)),
        ),
        DefaultUnderline(heightU: 2 / 820 * height, widthU: 35 / 411 * width),
        SizedBox(
          height: 20 / 820 * height,
        ),
      ],
    );
  }
}
