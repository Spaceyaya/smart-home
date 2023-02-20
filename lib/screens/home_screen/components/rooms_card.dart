import 'package:flutter/material.dart';

import '../../../consts.dart';
import '../../../model/rooms.dart';
import '../../room_screen/room_screen.dart';

class RoomsCard extends StatelessWidget {
  const RoomsCard({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  final RoomsModel rooms;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoomScreen.routeName, arguments: rooms);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 25 / 411 * width),
        child: Container(
          height: 341 / 820 * height,
          width: 225 / 411 * width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/imgs/bed.jpg'),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ]),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 40,
                child: Text(
                  rooms.name.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
