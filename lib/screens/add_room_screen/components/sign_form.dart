import 'package:flutter/material.dart';
import 'package:smarthome/components/default_button.dart';
import 'package:smarthome/consts.dart';
import 'package:smarthome/provider/button_controller.dart';
import 'package:smarthome/screens/home_screen/home_screen.dart';
import 'package:smarthome/services/add_room_service.dart';

import '../../../components/form_error.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final ImagePickerControler _imagePickerControler = ImagePickerControler();

  final _formKey = GlobalKey<FormState>();
  String? roomName;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50 / 411 * width),
          child: Column(
            children: [
              buildAddRoomFormField(),
              SizedBox(
                height: 20 / 820 * height,
              ),
              FloatingActionButton(
                onPressed: () => _imagePickerControler.showOptions(context),
                child: const Icon(
                  Icons.image_rounded,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Container(
              //   child: _imagePickerControler.imageFile != null
              //       ? Image.file(
              //           _imagePickerControler.imageFile[0],
              //           height: 100,
              //           width: 50,
              //         )
              //       : Text('there is no img to show'),
              // ),
              // const Icon(
              //   Icons.upload_file_rounded,
              //   size: 50,
              //   color: Color(0xff2ab0f1),
              // ),
              FormErrors(errors: errors),
              SizedBox(
                height: 200 / 820 * height,
              ),
              DefaultButton(
                text: 'Add Room',
                press: () {
                  AddRoomService().addRoom(
                    roomName: roomName!,
                  );
                  Navigator.popAndPushNamed(context, HomeScreen.routeName);
                },
                widthBtn: double.infinity,
                color: const Color(0xff2ab0f1),
              ),
              SizedBox(
                height: 15 / 820 * height,
              ),
            ],
          ),
        ));
  }

  TextFormField buildAddRoomFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.remove(kRoomNamelNullError);
          });
        }
        roomName = value;
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
        hintText: 'Room Name',
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
}
