import 'package:flutter/material.dart';
import 'package:smarthome/screens/add_room_screen/components/add_rrom_body.dart';

class AddRoomScreen extends StatelessWidget {
  const AddRoomScreen({Key? key}) : super(key: key);
  static String routeName = '/add_room';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const AddRoomBody(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 96,
    title: const Text(
      'Creat New Room',
      style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: 'arial'),
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
