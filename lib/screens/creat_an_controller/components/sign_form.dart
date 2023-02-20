import 'package:flutter/material.dart';
import 'package:smarthome/components/default_button.dart';
import 'package:smarthome/model/rooms.dart';
import '../../../components/form_error.dart';
import '../../../consts.dart';
import '../../../services/add_btn_service.dart';
import '../../creat_new_mode_screen/components/divider.dart';
import '../../room_screen/room_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  String? controllerName;
  String? on, off;

  @override
  Widget build(BuildContext context) {
    var rooms = ModalRoute.of(context)!.settings.arguments as RoomsModel;
    
    getBack() {
      Navigator.popAndPushNamed(context, RoomScreen.routeName,arguments: rooms);
    }

    
    //RoomProvider roomsModel =
    //  ModalRoute.of(context)!.settings.arguments as RoomProvider;
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40 / 411 * width),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: buildControllerNameFormField(),
              ),
              FormErrors(errors: errors),
              SizedBox(
                height: 5 / 820 * height,
              ),
              const Divided(),
              // buildChooseRoomField('Choose Room'),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: buildOnFormField(),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: buildOffFormField('OFF Letter'.toUpperCase()),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 / 411 * width),
                child: DefaultButton(
                    text: 'Add Controller',
                    press: () async {
                      await postButton(rooms);
                      getBack(); // AddButtonService().postBtn(
                      //     name: controllerName!,
                      //     id: rooms.id!,
                      //     off: off!,
                      //     on: on!);
                      // Navigator.popAndPushNamed(context, RoomScreen.routeName);
                    
                    },
                    widthBtn: 300 / 411 * width,
                    color: const Color(0xff2ab0f1)),
              ),
            ],
          ),
        ));
  }

  // Padding buildChooseRoomField(String hintText) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: DropdownButtonFormField(
  //       hint: Text(hintText),
  //       items: _roomsList
  //           .map((e) => DropdownMenuItem(
  //                 value: e,
  //                 child: Text(e),
  //               ))
  //           .toList(),
  //       onChanged: (val) {
  //         setState(() {
  //           _selectedVal = val as String;
  //         });
  //       },
  //       value: _selectedVal,
  //       decoration: InputDecoration(
  //         contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //         border: outlineInputBorder(),
  //         focusedBorder: outlineInputBorder(),
  //         enabledBorder: outlineInputBorder(),
  //       ),
  //     ),
  //   );
  // }

  TextFormField buildControllerNameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.remove(kRoomNamelNullError);
          });
        }
        controllerName = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.add(kRoomNamelNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Controller Name',
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildOnFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.remove(kRoomNamelNullError);
          });
        }
        on = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.add(kRoomNamelNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'On Key',
        hintStyle: TextStyle(fontSize: 14 / 411 * width),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15 / 411 * width, vertical: 15 / 820 * height),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildOffFormField(String hintText) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.remove(kRoomNamelNullError);
          });
        }
        off = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.add(kRoomNamelNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Off Key',
        hintStyle: TextStyle(fontSize: 14 / 411 * width),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15 / 411 * width, vertical: 15 / 820 * height),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFF757575),
      ),
    );
  }

  Future<void> postButton(
    RoomsModel roomsModel,
  ) async {
    await AddButtonService().postBtn(
        name: controllerName!,
        id: roomsModel.id!.toString(),
        off: off!,
        on: on!);
  }
}
