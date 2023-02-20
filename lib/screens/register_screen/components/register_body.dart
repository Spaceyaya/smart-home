import 'package:flutter/material.dart';
import 'package:smarthome/screens/register_screen/components/register_sign_form.dart';

import '../../../../components/default_underline.dart';
import '../../../../consts.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 65 / 820 * height,
            ),
            Image.asset(
              'assets/imgs/rc_logo.png',
              width: 250 / 411 * width,
            ),
            SizedBox(
              height: 60 / 820 * height,
            ),
            Padding(
              padding: EdgeInsets.only(left: 52 / 411 * width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 50 / 411 * width, fontFamily: 'arial'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6 / 820 * height,
            ),
            Padding(
              padding: EdgeInsets.only(right: 283 / 411 * width),
              child: const DefaultUnderline(
                heightU: 2,
                widthU: 27,
              ),
            ),
            SizedBox(
              height: 40 / 820 * height,
            ),
            const SignForm(),
          ],
        ),
      ),
    );
  }
}
