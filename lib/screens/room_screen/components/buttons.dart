import 'package:flutter/material.dart';

import '../../../components/devices_default_button.dart';
import '../../../consts.dart';
import '../../../model/button.dart';
import '../../../model/rooms.dart';
import '../../../provider/button_controller.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> with TickerProviderStateMixin {
  final ButtonControler _buttonControler = ButtonControler();
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    var roomsAs = ModalRoute.of(context)!.settings.arguments as RoomsModel;
    return AnimatedBuilder(
        animation: Listenable.merge([
          _buttonControler,
        ]),
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.only(
                left: 10 / 411 * width, bottom: 40 / 820 * height),
            child: FutureBuilder<List<ButtonsModel>>(
              future: GetButtons().getAllButtons(roomsAs.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ButtonsModel> buttons = snapshot.data!;

                  return GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: buttons.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return DevicesDefaultButton(
                          buttonsModel: buttons[index],
                          
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        });
  }
}
