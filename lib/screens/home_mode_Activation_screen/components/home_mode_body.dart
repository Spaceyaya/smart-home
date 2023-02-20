import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../creat_new_mode_screen/creat_new_mode.dart';
import 'creat_new_mode_btn.dart';

class HomeModeBody extends StatelessWidget {
  const HomeModeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ModesOptionsCard(
        //   title: 'Home Mode',
        //   press: () {},
        // ),
        // ModesOptionsCard(
        //   title: 'Outside Mode',
        //   press: () {},
        // ),
        CreatNewModeBtn(
          press: () =>
              Navigator.pushNamed(context, CreatNewModeScreen.routeName),
          buttonName: 'Creat New Mode',
        ),
      ],
    );
  }
}
