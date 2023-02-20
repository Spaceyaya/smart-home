import 'package:flutter/material.dart';
import 'package:smarthome/routes.dart';
import 'package:smarthome/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: routes,
      initialRoute: LoginScreen.routeName,
    );
  }
}
