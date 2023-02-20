import 'package:flutter/material.dart';
import 'package:smarthome/consts.dart';

import '../../../model/rooms.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomsModel roomsModel =
        ModalRoute.of(context)!.settings.arguments as RoomsModel;
    return Container(
      height: 270 / 820 * height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Container(
            height: 258 / 820 * height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/imgs/bed.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 210 / 820 * height),
            child: Container(
              height: 200 / 820 * height,
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 10),
                    blurRadius: 20,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80 / 820 * height),
            child: Container(
              height: 200 / 820 * height,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 40 / 411 * width,
            bottom: 40 / 820 * height,
            child: Text(
              roomsModel.name! ,
              style: TextStyle(
                  fontSize: 25 / 411 * width, fontWeight: FontWeight.bold),
            ),
          ),
          // Positioned(
          //   bottom: 20 / 820 * height,
          //   left: 40 / 411 * width,
          //   child: Text(
          //     '3 Devices',
          //     style: TextStyle(
          //         fontSize: 20 / 411 * width,
          //         color: Colors.black.withOpacity(0.5)),
          //   ),
          // ),
          Positioned(
              bottom: 170 / 820 * height,
              left: 15 / 411 * width,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35 / 411 * width,
                ),
              ))
        ],
      ),
    );
  }
}
