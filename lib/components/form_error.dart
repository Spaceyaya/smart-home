import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/consts.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      errors.length,
      (index) => formErrorText(
        errors[index],
      ),
    ));
  }

  Row formErrorText(String errors) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 14 / 820 * height,
          width: 14 / 411 * width,
        ),
        SizedBox(
          width: 10 / 411 * width,
        ),
        Text(errors),
      ],
    );
  }
}
