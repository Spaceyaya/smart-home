import 'package:flutter/material.dart';
import 'package:smarthome/screens/register_screen/components/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String routeName = '/regiter';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBody(),
    );
  }
}
