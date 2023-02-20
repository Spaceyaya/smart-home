import 'package:flutter/material.dart';
import '../../../components/form_error.dart';
import '../../../consts.dart';
import 'divider.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  _SignFormState() {
    _selectedValR = _roomsList[0];
    _selectedValD = _devices[0];
    _selectedValS = _state[0];
  }
  String? roomName;
  final List<String> errors = [];
  final _roomsList = ["Living Room", "Bed Room", "Bathroom"];
  final _devices = ["AC", "Main Light", "Sex Light"];
  final _state = [
    "ON",
    "OFF",
  ];
  String? _selectedValR = "";
  String? _selectedValD = "";
  String? _selectedValS = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40 / 411 * width),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: buildModeFormField(),
            ),
            FormErrors(errors: errors),
            SizedBox(
              height: 5 / 820 * height,
            ),
            const Divided(),
            buildChooseField(
              'Choose Room',
              (p0) => (val) {
                setState(() {
                  _selectedValR = val as String;
                });
              },
              _selectedValR,
              _roomsList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            buildChooseField(
              'Choose Device',
              (p0) => (val) {
                setState(() {
                  _selectedValD = val as String;
                });
              },
              _selectedValD,
              _devices
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            buildChooseField(
              'Choose State',
              (p0) => (val) {
                setState(() {
                  _selectedValS = val as String;
                });
              },
              _selectedValS,
              _state
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildChooseField(String hintText, Function(void)? press,
      String? value, List<DropdownMenuItem<String>> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonFormField(
        hint: Text(hintText),
        items: list,
        onChanged: press,
        value: value,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  TextFormField buildModeFormField() {
    return TextFormField(
      onSaved: (newValue) => roomName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRoomNamelNullError)) {
          setState(() {
            errors.remove(kRoomNamelNullError);
          });
        }
        return null;
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
        hintText: 'Mode Name     |',
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  // TextFormField buildFormField(String hintText) {
  //   return TextFormField(
  //     onChanged: (value) {},
  //     validator: (value) {},
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //       hintText: hintText,
  //       hintStyle: TextStyle(fontSize: 12 / 411 * width),
  //       contentPadding: EdgeInsets.symmetric(
  //           horizontal: 15 / 411 * width, vertical: 15 / 820 * height),
  //       border: outlineInputBorder(),
  //       focusedBorder: outlineInputBorder(),
  //       enabledBorder: outlineInputBorder(),
  //     ),
  //   );
  // }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFF757575),
      ),
    );
  }
}
