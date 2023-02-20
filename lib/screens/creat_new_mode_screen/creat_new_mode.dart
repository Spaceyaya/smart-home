import 'package:flutter/material.dart';
import 'package:smarthome/screens/creat_new_mode_screen/components/body.dart';


class CreatNewModeScreen extends StatelessWidget {
  const CreatNewModeScreen({Key? key}) : super(key: key);
  static String routeName = '/creat_new_controller';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNewModeAppBar(context),
      body: const CreatNewModeBody(),
    );
  }
}

AppBar buildNewModeAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 96,
    title: const Text(
      'Creat New Mode',
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ),
    ),
  );
}
