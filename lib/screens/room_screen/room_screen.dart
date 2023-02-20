import 'package:flutter/material.dart';
import 'package:smarthome/screens/room_screen/components/room_screen_body.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);
  static String routeName = '/room_screen';

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(
      body: RoomScreenBody(),
    );
  }
}
