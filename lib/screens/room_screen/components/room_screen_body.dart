import 'package:flutter/material.dart';
import 'package:smarthome/model/rooms.dart';
import 'package:smarthome/screens/home_screen/home_screen.dart';
import 'package:smarthome/screens/room_screen/components/buttons.dart';
import 'package:smarthome/screens/room_screen/components/screen_header.dart';
import '../../../provider/button_controller.dart';
import '../../creat_an_controller/creat_an_controller_screen.dart';
import '../../home_mode_Activation_screen/components/creat_new_mode_btn.dart';

class RoomScreenBody extends StatefulWidget {
  const RoomScreenBody({Key? key}) : super(key: key);

  @override
  State<RoomScreenBody> createState() => _RoomScreenBodyState();
}

class _RoomScreenBodyState extends State<RoomScreenBody> {
  // int? currentIndex;
  // final ButtonControler _buttonControler = ButtonControler();
  @override
  Widget build(BuildContext context) {
    var rooms = ModalRoute.of(context)!.settings.arguments;
    var roomsAs = ModalRoute.of(context)!.settings.arguments as RoomsModel;

    return SingleChildScrollView(
      child: Column(
        children: [
          const ScreenHeader(),
          const Buttons(),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: FutureBuilder<List<ButtonsModel>>(
          //     future: GetButtons().getAllButtons(roomsAs.id),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         List<ButtonsModel> buttons = snapshot.data!;

          //         return GridView.builder(
          //             clipBehavior: Clip.none,
          //             itemCount: buttons.length,
          //             shrinkWrap: true,
          //             scrollDirection: Axis.vertical,
          //             gridDelegate:
          //                 const SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 2,
          //                     childAspectRatio: 1.1,
          //                     crossAxisSpacing: 0,
          //                     mainAxisSpacing: 0),
          //             itemBuilder: (context, index) {
          //               return DevicesDefaultButton(
          //                 buttonsModel: buttons[index],
          //                 isOff: currentIndex == _buttonControler.buttons[0],
          //               );
          //             });
          //       } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     },
          //   ),
          // ),
          // const Buttons(),
          // AnimatedBuilder(
          //     animation: Listenable.merge([_controler]),
          //     builder: (
          //       context,
          //       snapshot,
          //     ) {
          //       return Padding(
          //           padding: EdgeInsets.only(
          //               left: 30 / 411 * width, bottom: 40 / 820 * height),
          //           child: FutureBuilder<List<ButtonsModel>>(
          //             builder: (context, snapshot) {
          //               if (snapshot.hasData) {
          //                 List<ButtonsModel> buttons = snapshot.data!;
          //                 return GridView.builder(
          //                     clipBehavior: Clip.none,
          //                     itemCount: buttons.length,
          //                     shrinkWrap: true,
          //                     scrollDirection: Axis.vertical,
          //                     gridDelegate:
          //                         const SliverGridDelegateWithFixedCrossAxisCount(
          //                             crossAxisCount: 2,
          //                             childAspectRatio: 1,
          //                             crossAxisSpacing: 10,
          //                             mainAxisSpacing: 10),
          //                     itemBuilder: (context, index) {
          //                       return DevicesDefaultButton(
          //                         press: () => _controler.updateButton(index),
          //                         isOff: _controler.buttons[index],
          //                       );
          //                     });
          //               } else {
          //                 return const Center(
          //                     child: CircularProgressIndicator());
          //               }
          //             },
          //           ));
          //     }),
          CreatNewModeBtn(
            press: () {
              Navigator.pushNamed(context, CreatAnController.routeName,
                  arguments: rooms);
            },
            buttonName: 'Add new Controller',
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Delete'),
                content: const Text('Are you sure ?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        DeleteRoom().deleteRoom(id: roomsAs.id!.toInt());

                        Navigator.popAndPushNamed(context, HomeScreen.routeName,
                            arguments: roomsAs);
                      },
                      child: const Text('Yes')),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'))
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text('Delete Room'),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  deleteConfirmation(BuildContext context, int id) {}
}
