// import 'package:flutter/material.dart';
// import 'package:smarthome/provider/button_controller.dart';

// import '../../../consts.dart';
// import 'modes_options.dart';

// class ModesOptionsCard extends StatefulWidget {
//   const ModesOptionsCard({
//     Key? key,
//     required this.title,
//     required this.press,
//   }) : super(key: key);
//   final String title;
//   final VoidCallback press;

//   @override
//   State<ModesOptionsCard> createState() => _ModesOptionsCardState();
// }

// class _ModesOptionsCardState extends State<ModesOptionsCard>
//     with TickerProviderStateMixin {
//   final ButtonControler _controler = ButtonControler();
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: Listenable.merge([_controler]),
//         builder: (context, snapshot) {
//           return GestureDetector(
//             onTap: widget.press,
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 6 / 820 * height),
//               padding: EdgeInsets.only(
//                   left: 25 / 411 * width, top: 7 / 820 * height),
//               height: 151 / 820 * height,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color(0xfff9f9f9),
//                 border: Border.all(
//                     color: const Color(0xffd9d9d9).withOpacity(0.5),
//                     width: 2 / 411 * width),
//               ),
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         widget.title,
//                         style: const TextStyle(
//                             fontSize: 31, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: _controler.buttons.length,
//                       itemBuilder: (context, index) {
//                         return ModesOptions(
//                             roomName: 'Ac-Living room',
//                             isOff: _controler.buttons[index],
//                             press: () => _controler.updateButton(index));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
