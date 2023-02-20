import 'package:flutter/material.dart';
import 'package:smarthome/components/default_button.dart';
import 'package:smarthome/consts.dart';
import 'package:smarthome/screens/home_screen/home_screen.dart';
import 'package:smarthome/screens/login_screen/components/text_buttton.dart';
import 'package:smarthome/screens/register_screen/register_screen.dart';
import 'package:smarthome/services/login_service.dart';

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
              buildEmailFormField(),
              SizedBox(
                height: 15 / 820 * height,
              ),
              buildPassFormField(),
              Row(
                children: [
                  Checkbox(
                      shape: const CircleBorder(),
                      activeColor: const Color(0xff2ab0f1),
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      }),
                  const Text('Remember me'),
                  const Spacer(),
                  TextBtn(
                    press: () {},
                    text: 'Forgot Password ?',
                  ),
                ],
              ),
              FormErrors(errors: errors),
              SizedBox(
                height: 15 / 820 * height,
              ),
              DefaultButton(
                text: 'Login'.toUpperCase(),
                press: () async{
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    await LoginService().login(email: email!, pass: password!);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false);
                    //Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                },
                widthBtn: double.infinity,
                color: const Color(0xff2ab0f1),
              ),
              SizedBox(
                height: 15 / 820 * height,
              ),
              TextBtn(text: 'Technical Support', press: () {}),
              const SizedBox(
                height: 15,
              ),
              TextBtn(
                  text: 'Sign Up',
                  press: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  }),
            ],
          ),
        ));
  }

  TextFormField buildEmailFormField() {
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

  TextFormField buildPassFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          password = value;
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
