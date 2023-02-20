import 'package:flutter/material.dart';
import 'package:smarthome/screens/creat_an_controller/components/body.dart';

class CreatAnController extends StatefulWidget {
  const CreatAnController({
    Key? key,
  }) : super(key: key);
  static String routeName = '/creat_an_controller';

  @override
  State<CreatAnController> createState() => _CreatAnControllerState();
}

class _CreatAnControllerState extends State<CreatAnController> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: buildAnControllerAppBar(context),
      body: const CreatAnControllerBody(
        
      ),
    );
  }
}

AppBar buildAnControllerAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 96,
    title: const Text(
      'Creat An Controller',
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
