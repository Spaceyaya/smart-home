import 'package:flutter/cupertino.dart';
import 'package:smarthome/screens/add_room_screen/add_room_screen.dart';
import 'package:smarthome/screens/creat_an_controller/creat_an_controller_screen.dart';
import 'package:smarthome/screens/creat_new_mode_screen/creat_new_mode.dart';
import 'package:smarthome/screens/home_mode_Activation_screen/home_mode_screen.dart';
import 'package:smarthome/screens/home_screen/home_screen.dart';
import 'package:smarthome/screens/login_screen/login_screen.dart';
import 'package:smarthome/screens/register_screen/register_screen.dart';

import 'package:smarthome/screens/room_screen/room_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  HomeModeActivationScreen.routeName: (context) =>
      const HomeModeActivationScreen(),
  AddRoomScreen.routeName: (context) => const AddRoomScreen(),
  RoomScreen.routeName: (context) => const RoomScreen(),
  CreatNewModeScreen.routeName: (context) => const CreatNewModeScreen(),
  CreatAnController.routeName: (context) => const CreatAnController(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
};
