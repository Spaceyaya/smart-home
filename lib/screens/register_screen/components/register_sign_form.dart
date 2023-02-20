import 'package:flutter/material.dart';
import 'package:smarthome/components/default_button.dart';
import 'package:smarthome/consts.dart';
import 'package:smarthome/screens/login_screen/components/text_buttton.dart';
import 'package:smarthome/services/register_service.dart';

import '../../../components/form_error.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  String? phoneNumber;
  final List<String> errors = [];
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50 / 411 * width),
          child: Column(
            children: [
              buildNameFormField(),
              SizedBox(
                height: 15 / 820 * height,
              ),
              buildPhoneNumberFormField(),
              SizedBox(
                height: 15 / 820 * height,
              ),
              buildRegisterEmailFormField(),
              SizedBox(
                height: 15 / 820 * height,
              ),
              buildRegisterPassFormField(),
              FormErrors(errors: errors),
              SizedBox(
                height: 15 / 820 * height,
              ),
              DefaultButton(
                text: 'Register'.toUpperCase(),
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    RegisterService().register(
                        name: name!,
                        email: email!,
                        pass: password!,
                        phoneNumber: phoneNumber!);
                    Navigator.pop(context);
                  }
                },
                widthBtn: double.infinity,
                color: const Color(0xff2ab0f1),
              ),
              SizedBox(
                height: 15 / 820 * height,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    const Text('Already have an account'),
                    const SizedBox(
                      width: 5,
                    ),
                    TextBtn(
                        text: 'Login',
                        press: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  TextFormField buildRegisterEmailFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
          email = value;
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        email = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });

          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });

          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email Address      |',
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(knameNullError)) {
          setState(() {
            errors.remove(knameNullError);
          });
        }
        name = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(knameNullError)) {
          setState(() {
            errors.add(knameNullError);
          });

          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Name',
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
        phoneNumber = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );
  }

  TextFormField buildRegisterPassFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password              |',
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
