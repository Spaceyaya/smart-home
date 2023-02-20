import 'package:flutter/material.dart';
import 'package:smarthome/screens/add_room_screen/add_room_screen.dart';

import '../../../components/default_underline.dart';
import '../../../consts.dart';

class TitleAndAddBtn extends StatelessWidget {
  const TitleAndAddBtn({
    Key? key, required this.roomCount,
  }) : super(key: key);
  final String roomCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20 / 820 * height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5 / 411 * width),
                child: Text(
                  'Rooms',
                  style: TextStyle(
                      fontFamily: 'arial', fontSize: 31 / 411 * width),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5 / 411 * width),
                child: DefaultUnderline(
                    heightU: 2 / 820 * height, widthU: 30 / 411 * width),
              ),
              SizedBox(
                height: 5 / 820 * height,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5 / 411 * width),
                child: Text(
                  'Total $roomCount Rooms',
                  style: TextStyle(
                      fontFamily: 'arial',
                      fontSize: 14 / 411 * width,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 45 / 411 * width),
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AddRoomScreen.routeName),
              child: const Text(
                'Add+',
                style: TextStyle(color: Color(0xff2ab0f1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
