import 'package:flutter/material.dart';
import 'package:smarthome/screens/home_mode_Activation_screen/components/home_mode_body.dart';

class HomeModeActivationScreen extends StatelessWidget {
  const HomeModeActivationScreen({Key? key}) : super(key: key);
  static String routeName = '/home_mode_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeModeAppBar(context),
      body: const HomeModeBody(),
    );
  }

  AppBar buildHomeModeAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 96,
      title: const Text(
        'Select Mode',
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
}
