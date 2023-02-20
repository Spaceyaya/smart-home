import 'package:flutter/material.dart';
import 'package:smarthome/consts.dart';
import 'package:smarthome/screens/add_room_screen/components/sign_form.dart';

class AddRoomBody extends StatelessWidget {
  const AddRoomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 120 / 820 * height,
          ),
          const SignForm(),
        ],
      ),
    );
  }
}
