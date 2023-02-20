import 'package:flutter/material.dart';

import 'package:smarthome/consts.dart';
import 'package:smarthome/screens/creat_new_mode_screen/components/sign_form.dart';

import '../../../components/default_button.dart';
import 'new_modes_options.dart';

class CreatNewModeBody extends StatelessWidget {
  const CreatNewModeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50 / 820 * height,
          ),
          const SignForm(),
          DefaultButton(
            text: 'Add Action',
            press: () {},
            widthBtn: 176,
            color: Colors.black.withOpacity(0.6),
          ),
          SizedBox(
            height: 50 / 820 * height,
          ),
          const NewModesOptions(roomName: 'AC-Living Room', on: 'ON'),
          const NewModesOptions(roomName: 'Lights-Living Room', on: 'ON'),
          const NewModesOptions(roomName: 'Garage Door', on: 'ON'),
          const NewModesOptions(roomName: 'Heater-BathRoom', on: 'ON'),
          SizedBox(
            height: 100 / 820 * height,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40 / 411 * width),
            child: DefaultButton(
              text: 'Save Mode',
              press: () {},
              widthBtn: double.infinity,
              color: const Color(0xff2ab0f1),
            ),
          ),
          SizedBox(
            height: 50 / 820 * height,
          ),
        ],
      ),
    );
  }
}
