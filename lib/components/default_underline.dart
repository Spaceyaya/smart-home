import 'package:flutter/material.dart';

import '../consts.dart';

class DefaultUnderline extends StatelessWidget {
  const DefaultUnderline({
    Key? key,
    required this.heightU,
    required this.widthU,
  }) : super(key: key);

  final double heightU, widthU;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightU / 820 * height,
      width: widthU / 411 * width,
      decoration: const BoxDecoration(
        color: Color(0xff2ab0f1),
      ),
    );
  }
}
