// import 'package:flutter/material.dart';

// import '../../../components/devices_default_button.dart';

// import '../../../provider/button_controller.dart';

// class MostUsedControlls extends StatefulWidget {
//   const MostUsedControlls({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MostUsedControlls> createState() => _MostUsedControllsState();
// }

// class _MostUsedControllsState extends State<MostUsedControlls>
//     with TickerProviderStateMixin {
//   final GetButtons _getButtons = GetButtons();
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: Listenable.merge([_getButtons]),
//       builder: (context, snapshot) {
//         return GridView.builder(
//             clipBehavior: Clip.none,
//             itemCount: _getButtons.buttons.length,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10),
//             itemBuilder: (context, index) {
//               return DevicesDefaultButton(
//                 roomName: 'Living Room',
//                 // deviceName: 'AC',
//                 press: () => _getButtons.updateButtons(index),
//                 isOff: _getButtons.buttons[index],
//               );
//             });
//       },
//     );
//   }
// }
