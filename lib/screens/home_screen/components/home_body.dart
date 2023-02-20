import 'package:flutter/material.dart';

import 'package:smarthome/consts.dart';
import 'package:smarthome/model/rooms.dart';
import 'package:smarthome/provider/button_controller.dart';
import 'package:smarthome/screens/home_screen/components/divider.dart';

import 'package:smarthome/screens/home_screen/components/rooms_card.dart';
import 'package:smarthome/screens/home_screen/components/title_and_add_btn.dart';
import 'package:smarthome/screens/login_screen/login_screen.dart';

import 'package:smarthome/services/logout_service.dart';

import 'greeting_and_activation_mode.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var getData = GetData();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 40 / 411 * width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingAndHomeModeActivation(),
            const TitleAndAddBtn(
              roomCount: '0',
            ),
            FutureBuilder<List<RoomsModel>>(
              future: getData.getAllRooms(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<RoomsModel> rooms = snapshot.data!;
                  return SizedBox(
                    height: 345,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: rooms.length,
                      itemBuilder: (context, index) =>
                          RoomsCard(rooms: rooms[index]),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(
            //       Rooms.fromjson(data),
            //       (index) => RoomsCard(
            //         press: () {
            //           Navigator.pushNamed(context, RoomScreen.routeName);
            //         },
            //         rooms: roomsDemo[index],
            //       ),
            //     ),
            //   ),
            // ),
            const Divied(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 40 / 411 * width),
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure ?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              LogoutService().logout();
                              // await cleanUp();

                              // DeleteRoom().deleteRoom(id: roomsAs.id!.toInt())
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (Route<dynamic> route) => false);
                            },
                            child: const Text('Yes')),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('No'))
                      ],
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('Logout'),
                ),
              ),
            ),
            // const MostUsedControllsTitle(),
            // const MostUsedControlls(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
